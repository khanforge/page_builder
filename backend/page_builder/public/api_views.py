from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import AllowAny, IsAuthenticated
from page_builder.models import Profile, Page, Component, SubComponent, ContentBlock
from common.models import Link
from .serializers import (
    PageModelSeializer, 
)


from django.shortcuts import get_object_or_404
from django.db import transaction

class PageAPIView(APIView):
    serializer_class = PageModelSeializer 
    permission_classes = [AllowAny]
    def get(self, request, *args, **kwargs):
        profil_slug = kwargs.get("profile_slug")
        slug = kwargs.get("slug")
        page_qs = Page.objects.filter(
            profile__slug = profil_slug,
            slug = slug
        )
        serialized = self.serializer_class(page_qs, many=True)
        return Response(serialized.data, status=status.HTTP_200_OK)

import logging
logger = logging.getLogger(__name__)
class PageSlugAPIView(APIView):
    def get(self, request, *args, **kwargs):
        logger.info("inside pageslugapiview")
        profil_slug = kwargs.get("profile_slug")
        page_qs = Page.objects.filter(
            profile__slug = profil_slug
        )

        res = [{
            "slug": page.slug,
        } for page in page_qs]

        return Response(
            res, status=status.HTTP_200_OK
        )