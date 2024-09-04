from django.db import models

# Create your models here.


class ProcessedImage(models.Model):
    id = models.AutoField(primary_key=True)
    image = models.ImageField(upload_to="processed_images/", null=True)
    accuracy = models.FloatField(null=True)
    object_counts = models.FloatField(null=True)


class UploadedImage(models.Model):
    image = models.ImageField(
        upload_to="images/"
    )  # Customize the upload path as needed
    uploaded_at = models.DateTimeField(auto_now_add=True)
