// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class DetectionResult extends Equatable {
  final num itemCount;
  final num averageAccuracy;
  final num minAccuracy;
  final num maxAccuracy;
  final String imagePath;
  const DetectionResult({
    required this.itemCount,
    required this.averageAccuracy,
    required this.minAccuracy,
    required this.maxAccuracy,
    required this.imagePath,
  });

  DetectionResult copyWith({
    int? itemCount,
    double? averageAccuracy,
    double? minAccuracy,
    double? maxAccuracy,
    String? imagePath,
  }) {
    return DetectionResult(
      itemCount: itemCount ?? this.itemCount,
      averageAccuracy: averageAccuracy ?? this.averageAccuracy,
      minAccuracy: minAccuracy ?? this.minAccuracy,
      maxAccuracy: maxAccuracy ?? this.maxAccuracy,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '': itemCount,
      'count': averageAccuracy,
      'min': minAccuracy,
      'max': maxAccuracy,
      'image_path': imagePath,
    };
  }

  factory DetectionResult.fromMap(Map<String, dynamic> map) {
    var fullPath = (map['image_path'] as String).split('/');
    final newStringPath =
        (map['image_path'] as String).replaceFirst('media', 'assets');
    print(newStringPath);
    final newPath = fullPath.map((e) {
      if (e == 'media') {
        return 'assets';
      }
      return e;
    });
    return DetectionResult(
      itemCount: map['count'] as num,
      averageAccuracy: map['average'],
      minAccuracy: map['min'] as num,
      maxAccuracy: map['max'] as num,
      imagePath: newStringPath,
    );
  }

  String toJson() => json.encode(toMap());

  factory DetectionResult.fromJson(String source) =>
      DetectionResult.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DetectionResult(itemCount: $itemCount, averageAccuracy: $averageAccuracy, minAccuracy: $minAccuracy, maxAccuracy: $maxAccuracy, imagePath: $imagePath)';
  }

  @override
  List<Object> get props {
    return [
      itemCount,
      averageAccuracy,
      minAccuracy,
      maxAccuracy,
      imagePath,
    ];
  }
}
