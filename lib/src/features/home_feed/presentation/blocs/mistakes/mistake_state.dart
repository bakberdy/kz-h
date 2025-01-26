part of 'mistake_bloc.dart';

abstract class MistakeState {}

class MistakeEmpty extends MistakeState{}

class MistakeInitial extends MistakeState {}

class MistakeLoading extends MistakeState {}

class MistakeLoaded extends MistakeState {
  final List<Question> questions;

  MistakeLoaded({required this.questions});
}

class MistakeNextPageLoading extends MistakeLoaded {
  MistakeNextPageLoading(List<Question> questions) : super(questions: questions);
}
class MistakeNextPageLoaded extends MistakeLoaded {
  MistakeNextPageLoaded(List<Question> questions) : super(questions: questions);
}

class MistakeError extends MistakeState {
  final String message;

  MistakeError({required this.message});
}
