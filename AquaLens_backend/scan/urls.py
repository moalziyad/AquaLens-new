from django.urls import path

from .views import ScanViews

urlpatterns = [
    path("scan/", ScanViews.as_view()),
]
