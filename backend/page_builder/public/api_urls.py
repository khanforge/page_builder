from django.urls import path
from .api_views import (
    PageAPIView,
    PageSlugAPIView
)


urlpatterns = [
    path("public/page/<str:profile_slug>/<str:slug>", PageAPIView.as_view()),
    path("public/slugs/<str:profile_slug>", PageSlugAPIView.as_view()),
] 
