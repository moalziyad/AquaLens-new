import 'package:aqua_lens/features/scan/domain/detection_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataRepository {
  final Dio client;

  DataRepository({required this.client});

  Future<DetectionResult> getDetectionResult(String filePath) async {
    print("====================Start============================");
    final fromData = FormData.fromMap({
      'image': await MultipartFile.fromFile(filePath, filename: 'myImage.jpg')
    });
    final response = await client.post("http://10.185.246.113:8000/api/scan/",
        data: fromData);
    print("======Respone ${response.data}===========");
    return DetectionResult.fromMap(response.data as Map<String, dynamic>);
  }
}

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});
final repositoryProvider = Provider<DataRepository>((ref) {
  return DataRepository(client: ref.watch(dioProvider));
});

final getDetectionResultProvider =
    FutureProvider.family<dynamic, String>((ref, filePath) async {
  return ref.read(repositoryProvider).getDetectionResult(filePath);
});
