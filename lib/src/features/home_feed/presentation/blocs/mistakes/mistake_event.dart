part of 'mistake_bloc.dart';

@immutable
sealed class QuestionEvent {}

class GetMistakeRequested extends QuestionEvent {
  GetMistakeRequested();
}
class GetNextMistakeRequested extends QuestionEvent {
  GetNextMistakeRequested();
}
