import '../../domain/entities/cat.dart';

class CatModel extends Cat {
  const CatModel({required String text, required String createdDate})
      : super(text: text, createdDate: createdDate);

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      text: json['text'] ?? '',
      createdDate: json['createdAt'] ?? '',
    );
  }
}
