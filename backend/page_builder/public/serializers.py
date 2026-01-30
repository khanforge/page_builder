from rest_framework import serializers
from django.contrib.auth.models import User
from page_builder.models import Profile, Page, Component, SubComponent, ContentBlock

class ProfileModelSeializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()
    image = serializers.SerializerMethodField()
    class Meta:
        model = Profile
        fields = "__all__"
        extra_kwargs = {
            "user":{"read_only": True}
        }
    
    def get_user(self, obj):
        user = User.objects.get(id = obj.user_id)
        return {
            "username": user.username,
            "email": user.email,
            "first_name": user.first_name,
            "last_name": user.last_name,
        }
    
    def get_image(self, obj):
        request = self.context.get("request")
        if obj.image:
            return request.build_absolute_uri(obj.image.url)
        return None


class ContentBlockModelSeializer(serializers.ModelSerializer):
    class Meta:
        model = ContentBlock
        fields = "__all__"

class SubComponentModelSeializer(serializers.ModelSerializer):
    content_blocks = ContentBlockModelSeializer(many=True, read_only=True, required=False)
    class Meta:
        model = SubComponent
        fields = "__all__"

class ComponentModelSeializer(serializers.ModelSerializer):
    sub_components = SubComponentModelSeializer(many=True, read_only=True, required=False)
    class Meta:
        model = Component
        fields = "__all__"

class PageModelSeializer(serializers.ModelSerializer):
    components = ComponentModelSeializer(many=True, read_only=True, required=False)
    profile = ProfileModelSeializer(read_only=True)
    section_slugs = serializers.SerializerMethodField()
    class Meta:
        model = Page
        fields = "__all__"
        extra_kwargs = {
            "profile": {"read_only": True}
        }
    
    def get_section_slugs(self, obj):
        components = Component.objects.filter(page=obj)
        slugs = [{
            "slug": component.slug,
            "title": component.title
        } for component in components]
        return slugs


