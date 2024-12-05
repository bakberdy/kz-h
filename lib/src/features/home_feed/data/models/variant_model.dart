import '../../domain/entities/variant.dart';

class VariantModel extends Variant {
  const VariantModel({required super.text, required super.correct});

  VariantModel copyWith({
    String? text,
    bool? correct,
  }) {
    return VariantModel(
      text: text ?? this.text,
      correct: correct ?? this.correct,
    );
  }

  factory VariantModel.fromJson(Map<String, dynamic> json) {
    return VariantModel(
      text: json['text'] as String,
      correct: json['correct'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'correct': correct,
    };
  }
}
