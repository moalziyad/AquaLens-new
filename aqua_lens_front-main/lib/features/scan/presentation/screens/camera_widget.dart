import 'package:aqua_lens/features/scan/presentation/screens/preview_image.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  CameraController? _controller;
  bool _isCameraInitialized = false;
  late final List<CameraDescription> _cameras;
  FlashMode _currentFlashMode = FlashMode.off;
  double _currentZoomLevel = 1.0;
  double _maxZoomLevel = 1.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initCamera();
  }

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    // Initialize the camera with the first camera in the list
    await onNewCameraSelected(_cameras.first);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = _controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<XFile?> capturePhoto() async {
    final CameraController? cameraController = _controller;
    if (cameraController!.value.isTakingPicture) {
      return null;
    }
    try {
      await cameraController.setFlashMode(_currentFlashMode);
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  void _onTakePhotoPressed() async {
    final navigator = Navigator.of(context);
    final xFile = await capturePhoto();
    if (xFile != null) {
      if (xFile.path.isNotEmpty) {
        navigator.push(
          MaterialPageRoute(
            builder: (context) => PreviewImageScreen(
              imagePath: xFile.path,
            ),
          ),
        );
      }
    }
  }

  void _onFlashModeButtonPressed() {
    setState(() {
      _currentFlashMode = _currentFlashMode == FlashMode.off
          ? FlashMode.auto
          : _currentFlashMode == FlashMode.auto
              ? FlashMode.always
              : FlashMode.off;
    });
    _controller?.setFlashMode(_currentFlashMode);
  }

  void _onZoomLevelChanged(double zoomLevel) {
    setState(() {
      _currentZoomLevel = zoomLevel;
    });
    _controller?.setZoomLevel(zoomLevel);
  }

  @override
  Widget build(BuildContext context) {
    if (_isCameraInitialized) {
      return SafeArea(
        child: Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CameraPreview(_controller!),
              Positioned(
                top: 16,
                right: 16,
                child: IconButton(
                  icon: Icon(
                    _currentFlashMode == FlashMode.off
                        ? Icons.flash_off
                        : _currentFlashMode == FlashMode.auto
                            ? Icons.flash_auto
                            : Icons.flash_on,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: _onFlashModeButtonPressed,
                ),
              ),
              Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: Slider(
                  value: _currentZoomLevel,
                  min: 1.0,
                  max: _maxZoomLevel,
                  onChanged: _onZoomLevelChanged,
                  activeColor: Colors.white,
                ),
              ),
              Positioned(
                bottom: 5,
                child: IconButton(
                  onPressed: _onTakePhotoPressed,
                  icon: const Icon(
                    Icons.camera,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Future<void> onNewCameraSelected(CameraDescription description) async {
    final previousCameraController = _controller;

    final CameraController cameraController = CameraController(
      description,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    try {
      await cameraController.initialize();
      _maxZoomLevel = await cameraController.getMaxZoomLevel();
    } on CameraException catch (e) {
      debugPrint('Error initializing camera: $e');
    }

    await previousCameraController?.dispose();

    if (mounted) {
      setState(() {
        _controller = cameraController;
        _isCameraInitialized = _controller!.value.isInitialized;
      });
    }

    cameraController.addListener(() {
      if (mounted) setState(() {});
    });
  }
}
