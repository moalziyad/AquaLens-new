import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:aqua_lens/features/scan/domain/detection_result.dart';

class Post extends Equatable {
  final String userName;
  final String userAvatarUrl;
  final String postImageUrl;
  final String postName;
  final bool isLiked;
  final DetectionResult detectionResult;
  const Post({
    required this.userName,
    required this.userAvatarUrl,
    required this.postImageUrl,
    required this.postName,
    required this.isLiked,
    required this.detectionResult,
  });

  Post copyWith({
    String? userName,
    String? userAvatarUrl,
    String? postImageUrl,
    String? postName,
    bool? isLiked,
    DetectionResult? detectionResult,
  }) {
    return Post(
      userName: userName ?? this.userName,
      userAvatarUrl: userAvatarUrl ?? this.userAvatarUrl,
      postImageUrl: postImageUrl ?? this.postImageUrl,
      postName: postName ?? this.postName,
      isLiked: isLiked ?? this.isLiked,
      detectionResult: detectionResult ?? this.detectionResult,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'userAvatarUrl': userAvatarUrl,
      'postImageUrl': postImageUrl,
      'postName': postName,
      'isLiked': isLiked,
      'detectionResult': detectionResult.toMap(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      userName: map['userName'] as String,
      userAvatarUrl: map['userAvatarUrl'] as String,
      postImageUrl: map['postImageUrl'] as String,
      postName: map['postName'] as String,
      isLiked: map['isLiked'] as bool,
      detectionResult: DetectionResult.fromMap(map['detectionResult'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      userName,
      userAvatarUrl,
      postImageUrl,
      postName,
      isLiked,
      detectionResult,
    ];
  }
}
