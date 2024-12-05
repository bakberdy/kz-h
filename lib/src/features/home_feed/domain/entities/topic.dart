import 'package:equatable/equatable.dart';

class TopicIds extends Equatable{
  final String topicId;
  final String topicName;

  const TopicIds({required this.topicId, required this.topicName});

  @override
  // TODO: implement props
  List<Object?> get props => [topicId];


}