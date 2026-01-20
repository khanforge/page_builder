from django.contrib import admin
from page_builder.models import Profile, Page, Component, SubComponent, ContentBlock

# Register your models here.

admin.site.register(Profile)
admin.site.register(Page)
admin.site.register(Component)
admin.site.register(SubComponent)
admin.site.register(ContentBlock)