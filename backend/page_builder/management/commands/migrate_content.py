from django.core.management.base import BaseCommand
from page_builder.models import ContentBlock, Component, SubComponent, Page, Profile
from bs4 import BeautifulSoup
from django.db import transaction
from django.conf import settings
from pathlib import Path
import json

class Command(BaseCommand):
    file_path = Path(settings.BASE_DIR) / "page_builder/management/commands/data.html"
    page_slug = "about"
    profile_slug = "anurag"
    
    def handle(self, *args, **kwargs):
        with open(self.file_path, 'r') as file:
            data = file.read()
        
        soup = BeautifulSoup(data, 'html.parser')
        div_tags = soup.find_all('div')

        li_tags = []
        for div in div_tags:
            li_tags = div.find_all('li')
            title = div.find('h2').text if div.find('h2') else None

            with transaction.atomic():
                try:
                    page = Page.objects.get(slug=self.page_slug, profile__slug = self.profile_slug)
                except Page.DoesNotExist:
                    page = Page.objects.create(slug=self.page_slug, profile = Profile.objects.get(slug=self.profile_slug))

                try:
                    Component.objects.get(page=page, title=title)
                    return # Component already exists, skip creation
                except Component.DoesNotExist:
                    pass
                component = Component.objects.create(
                    page = page,
                    title = title,
                    layout = "publications",

                )
                sub_component = SubComponent.objects.create(
                    component = component,
                )
                list_data = [li.decode_contents().strip() for li in li_tags if li and li.decode_contents().strip()]
                content_block = ContentBlock.objects.create(
                    subcomponent = sub_component,
                    content_type = "list",
                    data  = list_data
                )
                print(f"Content Block created with id: {content_block.id}")
