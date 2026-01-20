from django.db import models

# Create your models here.
class Icon(models.Model):
    label = models.CharField(max_length=100)
    value = models.TextField()

    def __str__(self):
        return f"{self.label}"

class Link(models.Model):
    label = models.CharField(max_length=200)
    url = models.URLField()

    def __str__(self):
        return f"{self.label}-{self.id}"

class Stat(models.Model):
    label = models.CharField(max_length=200, blank=True, null=True)
    value = models.CharField(max_length=200)
    profile = models.ForeignKey("page_builder.Profile", on_delete=models.CASCADE)
    icon = models.ForeignKey(Icon, on_delete=models.SET_NULL, blank=True, null=True)
    order = models.SmallIntegerField(default=0)
    link = models.ForeignKey(Link, on_delete=models.SET_NULL, blank=True, null=True)

    def __str__(self):
        return f"{self.label}:{self.value}-page:{self.page.name}"

class Contact(models.Model):
    label = models.CharField(max_length=200, blank=True, null=True)
    value = models.CharField(max_length=200)
    profile = models.ForeignKey("page_builder.Profile", on_delete=models.CASCADE)
    icon = models.ForeignKey(Icon, on_delete=models.SET_NULL, blank=True, null=True)
    order = models.SmallIntegerField(default=0)

    def __str__(self):
        return f"{self.label} {self.value} {str(id)}"