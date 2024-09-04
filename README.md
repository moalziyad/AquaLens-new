---

# AquaLens: Microplastic Detection Model

## Overview

AquaLens is a project aimed at detecting microplastics in water using advanced deep learning techniques. This repository contains the code and resources for training and deploying the microplastic detection model. The model leverages computer vision and artificial intelligence to identify and track microplastic particles in water samples.

## Features

- **Microplastic Detection:** Utilizes a YOLOv5 model to accurately identify microplastic particles in images of water samples.
- **Scalable Architecture:** The model is built using the PyTorch framework, enabling easy training and fine-tuning for different datasets.
- **Real-time Analysis:** The system is designed to process images continuously, making it suitable for real-time monitoring of water sources.
- **Cross-Platform Deployment:** The model is integrated into a Django server-side application and connected to a Flutter-based front-end for seamless user interaction.

## Contents

- `Model/`
  - `train.py`: Script to train the YOLOv5 model on microplastic datasets.
  - `yolov5/`: Contains the implementation of the YOLOv5 architecture, including pre-trained weights and configuration files.
  - `data/`: Directory for storing datasets, including images and annotations.
  - `results/`: Output directory for saving trained models and evaluation metrics.
  - `requirements.txt`: List of Python dependencies required to run the project.

## Getting Started

### Prerequisites

- Python 3.8 or higher
- PyTorch 1.7 or higher
- CUDA (optional, for GPU support)
- Additional dependencies listed in `requirements.txt`

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/moalziyad/AquaLens-new.git
   cd AquaLens-new/Model
   ```

2. **Install the required dependencies:**

   ```bash
   pip install -r requirements.txt
   ```

3. **Download the YOLOv5 pre-trained weights:**

   Download the pre-trained weights from the [YOLOv5 repository](https://github.com/ultralytics/yolov5) or use the provided weights in the `yolov5/weights/` directory.

### Training the Model

To train the model on your dataset, use the `train.py` script:

```bash
python train.py --data data/microplastics.yaml --cfg yolov5/models/yolov5s.yaml --weights yolov5/weights/yolov5s.pt --epochs 100
```

Adjust the parameters as needed for your specific use case.

### Inference

After training, you can run inference on new images using the `detect.py` script:

```bash
python detect.py --weights runs/exp/weights/best.pt --source data/test_images/
```

This will generate predictions on the test images and save the results in the `runs/detect/` directory.

## Deployment

The trained model can be deployed as part of a web application using Django. The server-side application processes images uploaded by users and returns predictions in real-time. The front-end is built using Flutter, providing a cross-platform interface for interaction.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with your improvements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](../LICENSE) file for more details.

## Acknowledgments

- [YOLOv5](https://github.com/ultralytics/yolov5) - The base model architecture used in this project.
- [Kaggle](https://www.kaggle.com/) - Source of the datasets used for training and testing the model.
