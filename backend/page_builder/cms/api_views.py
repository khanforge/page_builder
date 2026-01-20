from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import AllowAny, IsAuthenticated
from page_builder.models import Profile, Page, Component, SubComponent, ContentBlock
from common.models import Link
from .serializers import (
    ProfileModelSeializer, 
    PageModelSeializer, 
    ComponentModelSeializer, 
    SubComponentModelSeializer,
    ContentBlockModelSeializer, 
)

from django.shortcuts import get_object_or_404
from django.db import transaction
# Create your views here.

class ProfileModelViewSet(ModelViewSet):
    serializer_class = ProfileModelSeializer
    permission_classes = [IsAuthenticated] 
    queryset = Page.objects.all()
    def get_queryset(self):
        queryset = Profile.objects.filter(user = self.request.user)
        return queryset
    
    def perform_create(self, serializer):
        serializer.save(user = self.request.user)
    
    def perform_update(self, serializer):
        serializer.save(user = self.request.user)
        

class PageModelViewSet(ModelViewSet):
    queryset = Page.objects.all()
    serializer_class = PageModelSeializer
    permission_classes = [IsAuthenticated] 

    def get_queryset(self):
        return Page.objects.filter(
            profile__user_id = self.request.user.id
        )
    
    def perform_create(self, serializer):
        serializer.save(profile=self.request.user.profile) 

class ComponentModelViewSet(ModelViewSet):
    queryset = Component.objects.all()
    serializer_class = ComponentModelSeializer
    # permission_class = [IsAuthenticated]
    def get_queryset(self):
        page_id = self.request.GET.get("page")
        queryset = Component.objects.all()
        if page_id:
            return queryset.filter(
                page_id = page_id
            )
        return queryset

class SubComponentModelViewSet(ModelViewSet):
    queryset = SubComponent.objects.all()
    serializer_class = SubComponentModelSeializer

class ContentBlockModelViewSet(ModelViewSet):
    queryset = ContentBlock.objects.all()
    serializer_class = ContentBlockModelSeializer

class CreateComponentAPIView(APIView):
    def post(self, request, *args, **kwargs):
        data = request.data
        page = Page.objects.get(id=self.kwargs.get("page_id"))
        component = Component.objects.create(
            page=page,
            title=data["title"],
            is_active=data.get("is_active", True),
        )

        for link in data.get("links", []):
            l = Link.objects.create(
                label=link["label"],
                url=link["url"]
            )
            component.link.add(l)

        for idx, sub in enumerate(data.get("subcomponents", [])):
            subcomponent = SubComponent.objects.create(
                component=component,
                title=sub.get("title"),
                is_active=sub.get("is_active", True),
                order=idx
            )

            for cidx, content in enumerate(sub.get("content", [])):
                ContentBlock.objects.create(
                    subcomponent=subcomponent,
                    content_type=content["content_type"],
                    data=content.get("data"),
                    order=cidx
                )

        return Response(
            {"message": "Component created successfully"},
            status=status.HTTP_201_CREATED
        )

class UpdateComponentAPIView(APIView):
    def put(self, request, component_id, *args, **kwargs):
        data = request.data

        component = get_object_or_404(Component, id=component_id)

        with transaction.atomic():
            # 1️⃣ Update component fields
            component.title = data.get("title", component.title)
            component.is_active = data.get("is_active", component.is_active)
            component.save()

            # 2️⃣ Update links (clear & recreate)
            component.link.clear()
            for link in data.get("links", []):
                l = Link.objects.create(
                    label=link["label"],
                    url=link["url"]
                )
                component.link.add(l)

            # 3️⃣ Delete old subcomponents & content
            component.sub_components.all().delete()

            # 4️⃣ Recreate subcomponents & content blocks
            for sidx, sub in enumerate(data.get("subcomponents", [])):
                subcomponent = SubComponent.objects.create(
                    component=component,
                    title=sub.get("title"),
                    is_active=sub.get("is_active", True),
                    order=sidx
                )

                for cidx, content in enumerate(sub.get("content", [])):
                    ContentBlock.objects.create(
                        subcomponent=subcomponent,
                        content_type=content["content_type"],
                        data=content.get("data"),
                        order=cidx,
                        is_active=content.get("is_active", True)
                    )

        return Response(
            {"message": "Component updated successfully"},
            status=status.HTTP_200_OK
        )
