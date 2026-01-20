from common.models import Link, Icon
from django.db import models
from django.contrib.auth.models import User
from django.utils.text import slugify
from django.db.models.signals import post_save
from django.dispatch import receiver

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

@receiver(post_save, sender = User)
def manage_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user = instance)

class Page(models.Model):
    title = models.TextField(blank=True, null=True)
    slug = models.SlugField(blank=True, null=True)
    keyword = models.CharField(max_length=200, blank=True, null=True)
    footer = models.CharField(max_length=255, blank=True, null=True)
    profile = models.ForeignKey(Profile, on_delete=models.CASCADE)

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

class Component(models.Model):
    page = models.ForeignKey(Page, on_delete=models.CASCADE, related_name="components")
    title = models.CharField(max_length=200)
    slug = models.SlugField(blank=True, null=True)
    link = models.ManyToManyField(Link, blank=True)
    order = models.SmallIntegerField(default=0)
    is_active = models.BooleanField(default=True)

    class Meta:
        ordering = ["order"]

    def __str__(self):
        return f"{self.page.title} → {self.title}"
    
    def save(self, *args, **kwargs):
        base_slug = slugify(self.title)
        slug = base_slug
        counter = 1

        while Page.objects.filter(slug=slug, id=self.page_id).exclude(pk=self.pk).exists():
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

    data = models.TextField(blank=True, null=True)
    order = models.SmallIntegerField(default=0)
    is_active = models.BooleanField(default=True)

    class Meta:
        ordering = ["order"]

    def __str__(self):
        return f"{self.subcomponent.title} → {self.content_type}"
