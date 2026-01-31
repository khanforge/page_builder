from django.core.management.base import BaseCommand
from page_builder.models import ContentBlock, Component, SubComponent, Page, Profile
from bs4 import BeautifulSoup
from django.db import transaction
from django.conf import settings
from pathlib import Path
import re


def normalize_whitespace(html: str) -> str:
    """
    Collapse multiple spaces/newlines/tabs into a single space
    without breaking HTML tags.
    """
    return re.sub(r'\s+', ' ', html).strip()


class Command(BaseCommand):
    help = "Import HTML content and create components with normalized list data"

    file_path = Path(settings.BASE_DIR) / "page_builder/management/commands/"
    profile_slug = "anurag"

    def add_arguments(self, parser):
        parser.add_argument(
            "--file",
            type=str,
            default = "data.html"
        )

    def handle(self, *args, **options):
        self.file_path = self.file_path / options['file']
        if not self.file_path.exists():
            self.stderr.write(f"File not found: {self.file_path}")
            return

        with open(self.file_path, "r", encoding="utf-8") as file:
            html_data = file.read()

        soup = BeautifulSoup(html_data, "html.parser")
        div_blocks = soup.find_all("div")
        page_title = soup.find("section").get_text(strip=True) if soup.find("section") else None
        if not page_title:
            self.stderr.write("No page name found in <section> tag")
            return

        profile = Profile.objects.get(slug=self.profile_slug)

        with transaction.atomic():
            page, _ = Page.objects.get_or_create(
                title=page_title,
                profile=profile,
            )

            
            # Component title
            title_tag = soup.find("h2")
            component_title = title_tag.get_text(strip=True) if title_tag else None

            if not component_title:
                self.stderr.write("No Component title Found")

            component, created = Component.objects.get_or_create(
                page=page,
                title=component_title,
                defaults={
                    "layout": "publications",
                },
            )

            if not created:
                self.stdout.write(f"Component '{component_title}' already exists, skipping")

            for div in div_blocks:

                sub_component = SubComponent.objects.create(component=component)

                # Optional subcomponent title
                sub_title_tag = div.find("h3")
                if sub_title_tag:
                    sub_component.title = sub_title_tag.get_text(strip=True)
                    sub_component.save()

                li_tags = div.find_all("p")
                if li_tags == []:
                    li_tags = div.find_all("li")
                

                list_data = [
                    normalize_whitespace(li.decode_contents())
                    for li in li_tags
                    if li and normalize_whitespace(li.decode_contents())
                ]

                if not list_data:
                    self.stdout.write(f"No list items found for '{sub_title_tag}', skipping")
                    continue

                content_block = ContentBlock.objects.create(
                    subcomponent=sub_component,
                    content_type="list",
                    data=list_data,
                )

                self.stdout.write(
                    self.style.SUCCESS(
                        f"Created ContentBlock {content_block.id} for component '{component_title}'"
                    )
                )
