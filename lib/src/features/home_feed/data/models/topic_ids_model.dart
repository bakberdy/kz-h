import '../../domain/entities/topic.dart';

class TopicIdsModel extends TopicIds {
  const TopicIdsModel({required super.topicId, required super.topicName});

  TopicIdsModel copyWith({
    String? topicId,
    String? topicName,
  }) {
    return TopicIdsModel(
      topicId: topicId ?? this.topicId,
      topicName: topicName ?? this.topicName,
    );
  }

  factory TopicIdsModel.fromJson(Map<String, dynamic> json) {
    return TopicIdsModel(
      topicId: json['topicId'] as String,
      topicName: json['topicName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'topicId': topicId,
      'topicName': topicName,
    };
  }
}
