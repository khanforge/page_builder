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
        serialized = self.serializer_class(page_qs, many=True, context = {"request": request})
        return Response(serialized.data, status=status.HTTP_200_OK)

class PageSlugAPIView(APIView):
    def get(self, request, *args, **kwargs):
        profile_slug = kwargs.get("profile_slug")
        page_qs = Page.objects.filter(
            profile__slug = profile_slug
        )

        if not page_qs.exists():
            return Response(
                {"detail": "Profile not found"}, status=status.HTTP_404_NOT_FOUND
            )

        res = [{
            "slug": page.slug,
            "title": page.title
        } for page in page_qs]

        res = {
            "result": res,
            "user":{
                "first_name": page_qs.first().profile.user.first_name,
                "last_name": page_qs.first().profile.user.last_name
            }
        }
        return Response(
            res, status=status.HTTP_200_OK
        )