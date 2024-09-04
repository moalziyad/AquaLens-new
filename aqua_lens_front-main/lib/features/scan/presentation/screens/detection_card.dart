import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:aqua_lens/features/scan/domain/detection_result.dart';

class DetectionCard extends StatelessWidget {
  final DetectionResult result;

  const DetectionCard({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Detection Details'),
              children: [
                SimpleDialogOption(
                  child: Text('Microplastics: ${result.itemCount}'),
                ),
                SimpleDialogOption(
                  child: Text('Average Accuracy: ${result.averageAccuracy}%'),
                ),
                SimpleDialogOption(
                  child: Text('Max Accuracy: ${result.maxAccuracy}%'),
                ),
                SimpleDialogOption(
                  child: Text('Min Accuracy: ${result.minAccuracy}%'),
                ),
              ],
            );
          },
        );
      },
      child: CustomDetectionCard(
        result: result,
        height: 300, // Simplified height
        width: 200, // Use full width for simplicity
        fromCamera: false,
      ),
    );
  }
}

class CustomDetectionCard extends StatelessWidget {
  final DetectionResult result;
  final double height;
  final double width;
  final bool fromCamera;

  const CustomDetectionCard({
    super.key,
    required this.result,
    required this.height,
    required this.width,
    this.fromCamera = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.symmetric(
          vertical: 8, horizontal: 10), // Simplified margin
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade200,
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: fromCamera
                ? Image.file(
                    File(result.imagePath),
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    result.imagePath,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              width: width * 0.9, // Adjust width for a cleaner look
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withOpacity(0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${result.itemCount} Microplastics",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${result.averageAccuracy}% Accuracy",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
