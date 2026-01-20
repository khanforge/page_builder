from django.urls import path
from .api_views import (
    PageAPIView,
    PageSlugAPIView
)

urlpatterns = [
    path("public/page/<str:profile_slug>", PageAPIView.as_view()),
    path("public/page/slugs/<str:profile_slug>", PageSlugAPIView.as_view()),
] 
