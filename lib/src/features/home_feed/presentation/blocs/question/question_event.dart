part of 'question_bloc.dart';

@immutable
sealed class QuestionEvent {}

class GetQuestionRequested extends QuestionEvent{
  final int pageIndex;

  GetQuestionRequested({required this.pageIndex});
}
