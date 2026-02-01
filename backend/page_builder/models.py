from common.models import Link, Icon
from django.db import models
from django.contrib.auth.models import User
from django.utils.text import slugify
from django.db.models.signals import post_save
from django.dispatch import receiver
from common.models import CommonTimeStampModel
from datetime import datetime
from .utils import build_meta_description, build_title

# Create your models here.
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    image = models.ImageField(upload_to="profiles/img/", null=True, blank=True)
    image_badge = models.CharField(max_length=100, null=True, blank=True)
    designation = models.CharField(max_length=255, null=True, blank=True)
    organisation = models.TextField(null=True, blank=True)
    org_short_name = models.CharField(max_length=255, null=True, blank=True)
    address = models.CharField(max_length=255, null=True, blank=True)
    badge = models.CharField(max_length=255, null=True, blank=True)
    link = models.ManyToManyField(Link)
    slug = models.SlugField(null=True, blank=True)

    def __str__(self):
        return f"{self.user.username}-{self.id}"
    
    def save(self, *args, **kwargs):
        base_slug = slugify(self.user.username)
        slug = base_slug
        counter = 1

        while Profile.objects.filter(slug=slug, user_id=self.user_id).exclude(pk=self.pk).exists():
            slug = f"{base_slug}-{counter}"
            counter += 1

        self.slug = slug
        super().save(*args, **kwargs)

    @property
    def get_username(self):
        return self.user.username
    
    @property
    def get_full_name(self):
        return f"{self.user.first_name} {self.user.last_name}".strip() or self.get_username
    
    @property
    def get_email(self):
        return self.user.email
    
    @property
    def get_image_url(self):
        if self.image and hasattr(self.image, 'url'):
            return self.image.url
        return None
    
    @property
    def get_all_links(self):
        return self.link.all()

@receiver(post_save, sender = User)
def manage_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user = instance)

class Page(CommonTimeStampModel):
    title = models.TextField(blank=True, null=True)
    slug = models.SlugField(blank=True, null=True)
    keyword = models.CharField(max_length=200, blank=True, null=True)
    footer = models.CharField(max_length=255, blank=True, null=True)
    profile = models.ForeignKey(Profile, on_delete=models.CASCADE)
    seo_title = models.CharField(max_length=255, blank=True, null=True)
    seo_description = models.TextField()
    is_active = models.BooleanField(default=True)


    def __str__(self):
        return f"{self.slug}"
    
    def save(self, *args, **kwargs):
        base_slug = slugify(self.title)
        slug = base_slug
        counter = 1

        while Page.objects.filter(slug=slug, profile=self.profile).exclude(pk=self.pk).exists():
            slug = f"{base_slug}-{counter}"
            counter += 1

        self.slug = slug
        super().save(*args, **kwargs)

    def delete(self):
        self.is_active = False
        self.save(update_fields = ["is_active"])


    def update_updated_on(self):
        self.modified_on = datetime.now()
        if not self.added_on:
            self.added_on = datetime.now()
        self.save(update_fields = ["modified_on", "added_on"])
    
    def update_author(self, user):
        if self.added_by:
            self.added_by = self.page.profile.user
        
        self.modified_by = user
        self.save(update_fields = ["added_by", "modified_by"])

    @property
    def get_page_title(self):
        return build_title(self, self.profile.user)
    
    @property
    def get_page_description(self):
        return build_meta_description(self, self.profile.user)

class Component(models.Model):
    choices=[
            ("publications", "Publications"),
            ("cards", "Cards"),
            ("grid", "Grid"),
            ("timeline", "Timeline"),
            ("showcase", "Showcase"),
            ("centered", "Centered"),
            ("links", "Links"),
            ("default", "Default"),
        ]
    page = models.ForeignKey(Page, on_delete=models.CASCADE, related_name="components")
    title = models.CharField(max_length=200)
    slug = models.SlugField(blank=True, null=True)
    link = models.ManyToManyField(Link, blank=True)
    order = models.SmallIntegerField(default=0)
    layout = models.CharField(
        choices=choices, default='default', max_length=50
    )
    is_active = models.BooleanField(default=True)

    class Meta:
        ordering = ["order"]

    def __str__(self):
        return f"{self.page.title} → {self.title}"
    
    def save(self, *args, **kwargs):
        base_slug = slugify(self.title)
        slug = base_slug
        counter = 1

        while Component.objects.filter(slug=slug, page__id=self.page_id).exclude(pk=self.pk).exists():
            slug = f"{base_slug}-{counter}"
            counter += 1

        self.slug = slug
        super().save(*args, **kwargs)

class SubComponent(models.Model):
    component = models.ForeignKey(Component, on_delete=models.CASCADE, related_name="sub_components")
    title = models.CharField(max_length=200, blank=True, null=True)
    order = models.SmallIntegerField(default=0)
    is_active = models.BooleanField(default=True)

    class Meta:
        ordering = ["order"]

    def __str__(self):
        return f"{self.component.title} → {self.title or 'SubComponent'}"


class ContentBlock(models.Model):
    subcomponent = models.ForeignKey(SubComponent, on_delete=models.CASCADE, related_name="content_blocks")
    
    content_type = models.CharField(
        max_length=50,
        choices=[
            ("text", "Text"),
            ("list", "List"),
            ("numbered_list", "Numbered List"),
            ("image", "Image"),
            ("link", "Link"),
        ],
        default="text"
    )

    data = models.JSONField(blank=True, null=True)
    order = models.SmallIntegerField(default=0)
    is_active = models.BooleanField(default=True)

    class Meta:
        ordering = ["order"]

    def __str__(self):
        return f"{self.subcomponent.title} → {self.content_type}"
