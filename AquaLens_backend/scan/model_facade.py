import os

from model.model import acqalens

path = os.path.join(os.path.dirname(os.path.realpath(__file__)), "")


class ModelFacade:
    def __init__(self, image_path, *args, **kwargs):
        self.image_path = image_path

    def processImage(self):
        pretrained_model_location = path + "best.pt"
        model = acqalens(pretrained_model_location)
        model.predict(self.image_path)
        return model.properties()
