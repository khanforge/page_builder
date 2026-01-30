from django.urls import path
from .api_views import (
    ProfileModelViewSet,
    PageModelViewSet,
    ComponentModelViewSet,
    SubComponentModelViewSet,
    ContentBlockModelViewSet,
    CreateComponentAPIView,
    UpdateComponentAPIView
)
from rest_framework.routers import DefaultRouter

router = DefaultRouter()

router.register("profile", ProfileModelViewSet, basename="profile")
router.register("page", PageModelViewSet, basename="page")
router.register("component", ComponentModelViewSet, basename="component")
router.register("sub-component", SubComponentModelViewSet, basename="subcomponent")
router.register("content", ContentBlockModelViewSet, basename="content")

urlpatterns = router.urls

urlpatterns += [
    path("<int:page_id>/components/create", CreateComponentAPIView.as_view()),
    path(
        "components/<int:component_id>/update/",
        UpdateComponentAPIView.as_view(),
    ),
]