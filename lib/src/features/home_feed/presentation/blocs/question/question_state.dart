part of 'question_bloc.dart';

abstract class QuestionState {}

class QuestionInitial extends QuestionState {}

class QuestionLoading extends QuestionState {}

class QuestionLoaded extends QuestionState {
  final List<Question> questions;

  QuestionLoaded({required this.questions});
}

class NextPageLoading extends QuestionLoaded {
  NextPageLoading(List<Question> questions) : super(questions: questions);
}

class QuestionError extends QuestionState {
  final String message;

  QuestionError({required this.message});
}
