// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:aqua_lens/features/scan/domain/detection_result.dart';
import 'package:aqua_lens/features/scan/presentation/controller/scan_notifier.dart';
import 'package:aqua_lens/features/scan/presentation/screens/detection_card.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toast_service.dart';

class PreviewImageScreen extends ConsumerWidget {
  final String imagePath;
  const PreviewImageScreen({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Image.asset(
                  "assets/IMG_6693.png",
                  fit: BoxFit.fill,
                )),
          ),
          Positioned(
              bottom: 10,
              width: double.maxFinite,
              child: Row(children: [
                const SizedBox(
                  width: 64,
                ),
                GlassContainer(
                    height: 64,
                    width: 120,
                    color: Colors.red,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('home');
                        },
                        child: const Text(
                          "Discard",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))),
                const SizedBox(
                  width: 24,
                ),
                GlassContainer(
                    height: 64,
                    width: 120,
                    color: Colors.green,
                    child: TextButton(
                        onPressed: () async {
                          // final result = await ref
                          //     .read(scanProvider.notifier)
                          //     .getDetectionResult(imagePath);
                          Future.delayed(const Duration(milliseconds: 500), () {
                            ToastService.showWarningToast(
                              context,
                              length: ToastLength.long,
                              expandedHeight: 100,
                              message: "Possible Contamination Be Careful 😨!",
                            );
                          });
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              showDragHandle: true,
                              builder: (context) {
                                // final isLoading =
                                //     ref.watch(scanProvider).isLoading;
                                // final hasError =
                                //     ref.watch(scanProvider).hasError;

                                return const SizedBox(
                                    height: 700,
                                    width: double.infinity,
                                    child: ValidDetection(
                                        result: DetectionResult(
                                            itemCount: 5,
                                            averageAccuracy: 72.16,
                                            minAccuracy: 34,
                                            maxAccuracy: 89,
                                            imagePath:
                                                "assets/output_image.jpg")));
                              });
                        },
                        child: const Text(
                          "Analyze",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))),
              ])),
        ],
      ),
    );
  }
}

class GlassContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final Color color;
  const GlassContainer({
    super.key,
    required this.height,
    required this.width,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              width: width,
              height: height,
              // padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: color.withOpacity(0.2)),
              child: child,
            )));
  }
}

class ValidDetection extends StatelessWidget {
  final DetectionResult result;
  const ValidDetection({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDetectionCard(
          result: result,
          height: 460,
          width: 374,
          fromCamera: false,
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
            width: 300,
            child: FilledButton.icon(
              onPressed: () {
                ToastService.showSuccessToast(
                  context,
                  length: ToastLength.medium,
                  expandedHeight: 100,
                  message: "Detection saved successfully",
                );
                Navigator.of(context).pushNamed('home');
              },
              label: const Text("Save"),
              icon: const Icon(Icons.bookmark),
            )),
        SizedBox(
            width: 300,
            child: FilledButton.icon(
                onPressed: () {
                  ToastService.showSuccessToast(
                    context,
                    length: ToastLength.medium,
                    expandedHeight: 100,
                    message: "Detection shared successfully",
                  );
                  Navigator.of(context).pushNamed('home');
                },
                icon: const Icon(Icons.share),
                label: const Text("Share"))),
      ],
    );
  }
}
