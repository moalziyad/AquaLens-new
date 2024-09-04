import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:aqua_lens/features/scan/data/repository.dart';
import 'package:aqua_lens/features/scan/domain/detection_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScanNotifier extends AutoDisposeAsyncNotifier<List<DetectionResult>> {
  Future<DetectionResult> getDetectionResult(String imagePath) async {
    try {
      final repository = ref.watch(repositoryProvider);
      final result = await repository.getDetectionResult(imagePath);
      state = AsyncValue.data([result]);
      print("Result: $result");
      return result;
    } on DioException {
      state = AsyncError("Socket Exception", StackTrace.current);
      return const DetectionResult(
          itemCount: 0,
          averageAccuracy: 0,
          minAccuracy: 0,
          maxAccuracy: 0,
          imagePath: 'imagePath');
    }
  }

  @override
  FutureOr<List<DetectionResult>> build() {
    return [];
  }
}

final scanProvider =
    AsyncNotifierProvider.autoDispose<ScanNotifier, List<DetectionResult>>(
  ScanNotifier.new,
);
