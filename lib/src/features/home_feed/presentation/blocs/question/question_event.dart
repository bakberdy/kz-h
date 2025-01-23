part of 'question_bloc.dart';

@immutable
sealed class QuestionEvent {}

class GetQuestionRequested extends QuestionEvent {
  GetQuestionRequested();
}
