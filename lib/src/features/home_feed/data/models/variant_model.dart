import 'package:kz_h/src/features/home_feed/presentation/widgets/variant_widget.dart';

import '../../domain/entities/variant.dart';

class VariantModel extends Variant {
  const VariantModel(
      {required super.text, super.questionState, super.isCorrect});

  VariantModel copyWith({
    String? text,
    QuestionStateEnum? questionState,
  }) {
    return VariantModel(
      text: text ?? this.text,
      questionState: questionState ?? this.questionState,
    );
  }

  factory VariantModel.fromJson(Map<String, dynamic> json) {
    return VariantModel(
      isCorrect: json['correct'],
      text: json['text'] as String,
      questionState: (json['correct'] == null) || (!(json['selected'] as bool))
          ? QuestionStateEnum.notSelected
          : (json['correct'] as bool)
              ? QuestionStateEnum.correct
              : QuestionStateEnum.inccorrect,
    );
  }
  @override
  String toString() {
    return 'Variant $text, state: $questionState';
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'text': text,
  //     'correct': correct,
  //   };
  // }
}
