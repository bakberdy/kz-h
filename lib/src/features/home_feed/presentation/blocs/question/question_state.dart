part of 'question_bloc.dart';

@immutable
sealed class QuestionState {}

final class QuestionInitial extends QuestionState {}
final class QuestionLoading extends QuestionState{}
final class QuestionLoaded extends QuestionState{
  final List<Question> questions;

  QuestionLoaded({required this.questions});
}
final class QuestionError extends QuestionState{
  final String errorMessage;

  QuestionError(this.errorMessage);
}
