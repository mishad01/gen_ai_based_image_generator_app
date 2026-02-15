// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ImageModel {
  final String url;
  final String prompt;
  final String createdAt;

  ImageModel({
    required this.url,
    required this.prompt,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'prompt': prompt,
      'createdAt': createdAt,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      url: map['url'] as String,
      prompt: map['prompt'] as String,
      createdAt: map['createdAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
