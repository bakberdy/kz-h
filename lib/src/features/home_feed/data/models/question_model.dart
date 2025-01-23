import 'package:kz_h/src/features/home_feed/domain/entities/question.dart';
import 'variant_model.dart';
import 'topic_ids_model.dart';

class QuestionModel extends Question {
  const QuestionModel({
    required super.questionId,
    required super.question,
    required super.topicIds,
    required super.variants,
    super.topicName
  });

  QuestionModel copyWith({
    String? questionId,
    String? question,
    List<TopicIdsModel>? topicIds,
    List<VariantModel>? variants,
    String? topicName
  }) {
    return QuestionModel(
      topicName: topicName,
      questionId: questionId ?? this.questionId,
      question: question ?? this.question,
      topicIds: topicIds ?? this.topicIds.cast<TopicIdsModel>(),
      variants: variants ?? this.variants.cast<VariantModel>(),
    );
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      topicName: json['topicName'] as String?,
      questionId: json['questionId'] as String,
      question: json['question'] as String,
      topicIds: (json['topicIds'] as List<dynamic>)
          .map((e) => TopicIdsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      variants: (json['variants'] as List<dynamic>)
          .map((e) => VariantModel.fromJson(e as Map<String, dynamic>))
          .toList()..shuffle(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'topicName': topicName,
      'questionId': questionId,
      'question': question,
      'topicIds': topicIds.map((e) => (e as TopicIdsModel).toJson()).toList(),
      'variants': variants.map((e) => (e as VariantModel).toJson()).toList(),
    };
  }
}
