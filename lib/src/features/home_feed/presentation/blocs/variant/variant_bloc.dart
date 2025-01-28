import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kz_h/src/features/home_feed/domain/entities/variant.dart';
import 'package:kz_h/src/features/home_feed/domain/usecases/answer_to_mistake.dart';
import 'package:kz_h/src/features/home_feed/domain/usecases/answer_to_question.dart';
import 'package:kz_h/src/features/home_feed/presentation/widgets/variant_widget.dart';

part 'variant_event.dart';

part 'variant_state.dart';

class VariantBloc extends Bloc<VariantEvent, VariantState> {
  final AnswerToQuestion answerToQuestion;
  final AnswerToMistake answerToMistake;
  VariantBloc({required this.answerToMistake, required this.answerToQuestion})
      : super(VariantInitial()) {
    on<VariantTappedRequested>((event, emit) async {
      emit(VariantLoading(selectedOption: event.selectedOption));
      final failureOrVariants = event.isMistake?(await answerToMistake(
          params: AnswerToMistakeParams(
              mistakeQuestionId: event.questionId,
              selectedOption: event.selectedOption))):(await answerToQuestion(
          params: AnswerParams(
              questionId: event.questionId,
              selectedOption: event.selectedOption)));
      failureOrVariants.fold((failure) {
        emit(VariantError(failure.message));
      }, (variants) {
        final v = variants.firstWhere(
          (el) => el.text == event.selectedOption,
        );
        Variant? correctV;
        for (final variant in variants) {
          if (variant.isCorrect) {
            correctV = variant;
          }
        }

        final selectedVariant =
            variants.firstWhere((e) => e.text == event.selectedOption);

        if (v.questionState == QuestionStateEnum.inccorrect) {
          emit(VariantLoaded(
              variants: variants,
              correctVariant: correctV,
              selectedVariant: selectedVariant));
        } else {
          emit(VariantLoaded(
              variants: variants, selectedVariant: selectedVariant));
        }
      });
    });
  }
}
