import 'package:bloc/bloc.dart';
import 'package:kz_h/src/features/home_feed/domain/usecases/answer_to_question.dart';
import 'package:meta/meta.dart';

part 'variant_event.dart';

part 'variant_state.dart';

class VariantBloc extends Bloc<VariantEvent, VariantState> {
  final AnswerToQuestion answerToQuestion;
  VariantBloc({required this.answerToQuestion})
      : super(VariantInitial(index: 0)) {
    on<VariantTappedRequested>((event, emit) {
      emit(VariantLoading());
      answerToQuestion(
          params: AnswerParams(
              questionId: event.questionId,
              selectedOption: event.selectedOption));
      emit(VariantInitial(index: event.index, correct: event.correct));
    });
  }
}
