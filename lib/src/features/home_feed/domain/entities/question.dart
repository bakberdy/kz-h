import 'package:equatable/equatable.dart';
import 'package:kz_h/src/features/home_feed/domain/entities/topic.dart';

class Question extends Equatable {
  final String questionId;
  final String question;
  final List<TopicIds> topicIds;
  final List<String> variants;
  final String? topicName;
  final String? mistakeQuestionId;

  const Question(
      {this.topicName,
      this.mistakeQuestionId,
      required this.questionId,
      required this.question,
      required this.topicIds,
      required this.variants});

  @override
  List<Object?> get props => [questionId];

  // Map<String, dynamic> toMap() {
  //   return {
  //     'questionId': this.questionId,
  //     'question': this.question,
  //     'topicIds': this.topicIds,
  //     'variants': this.variants,
  //   };
  // }

  // factory Question.fromMap(Map<String, dynamic> map) {
  //   return Question(
  //     questionId: map['questionId'] as String,
  //     question: map['question'] as String,
  //     topicIds: map['topicIds'] as List<TopicIds>,
  //     variants: map['variants'] as List<String>,
  //   );
  // }
}
