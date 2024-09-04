from rest_framework import serializers

from .models import ProcessedImage, UploadedImage


class UploadedImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = UploadedImage
        fields = ["id", "image", "uploaded_at"]


class ProcessedImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProcessedImage
        fields = "__all__"
