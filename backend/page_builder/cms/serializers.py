from rest_framework import serializers
from django.contrib.auth.models import User
from page_builder.models import Profile, Page, Component, SubComponent, ContentBlock

class ProfileModelSeializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = "__all__"
        extra_kwargs = {
            "user":{"read_only": True}
        }

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
    class Meta:
        model = Page
        fields = "__all__"
        extra_kwargs = {
            "profile": {"read_only": True}
        }
    def create(self, validated_data):
        profile = validated_data.pop("profile")
        return Page.objects.create(profile=profile, **validated_data)


