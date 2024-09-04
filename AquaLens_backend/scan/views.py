import os

from django.conf import settings
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from model.model import AcqaLens

from .serializer import UploadedImageSerializer


class ScanViews(APIView):
    serializer_class = UploadedImageSerializer

    def get(self, request, *args, **kwargs):
        return Response("Hello world")

    def post(self, request, *args, **kwargs):
        serializer = UploadedImageSerializer(data=request.data)
        if serializer.is_valid():
            print("========== STEP [1] ===========")
            image = serializer.validated_data["image"]
            print("========== STEP [2] ===========")
            image_path = os.path.join(settings.MEDIA_ROOT, image.name)
            print("========== STEP [3] ===========")
            print(image_path)
            print(image)
            with open(image_path, "wb+") as destination:
                print("========== STEP [4] ===========")
                for chunk in image.chunks():
                    destination.write(chunk)
                print("========== STEP [5] ===========")
            model = AcqaLens("best.pt")
            print("========== STEP [6] ===========")
            model.predict(image_path)
            print("========== STEP [7] ===========")
            results = model.properties()
            print("========== STEP [8] ===========")

            return Response({"Success here"}, status=status.HTTP_200_OK)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
