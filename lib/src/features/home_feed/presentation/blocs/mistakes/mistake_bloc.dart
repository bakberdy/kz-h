import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kz_h/src/core/error/failures.dart';
import 'package:kz_h/src/core/usecase/usecase.dart';
import 'package:kz_h/src/features/home_feed/domain/usecases/get_mistakes.dart';

import '../../../domain/entities/question.dart';

part 'mistake_event.dart';
part 'mistake_state.dart';

class MistakeBloc extends Bloc<QuestionEvent, MistakeState> {
  final GetMistakes getMistakes;

  bool isFetchingNextPage = false; // Флаг для предотвращения повторного запроса

  MistakeBloc({required this.getMistakes}) : super(MistakeInitial()) {
    on<GetMistakeRequested>(_onGetQuestionRequested);
    on<GetNextMistakeRequested>(_onGetNextQuestionRequested);
  }

  Future<void> _onGetQuestionRequested(
      GetMistakeRequested event, Emitter<MistakeState> emit) async {
    emit(MistakeLoading());

    final questionsOrFailure = await getMistakes(params: NoParams());

    questionsOrFailure.fold(
      (failure) {
        var errorMessage = "";
        if (failure is ServerFailure) {
          errorMessage = failure.message;
        } else if (failure is AuthFailure) {
          errorMessage = "You are not authorized";
        } else if (failure is NetworkFailure) {
          errorMessage = "Please check your network connection";
        } else {
          errorMessage = "An unknown error occurred";
        }
        emit(MistakeError(message: errorMessage));
        isFetchingNextPage = false;
      },
      (questions) {
        emit(MistakeLoaded(questions: questions));
      },
    );
  }

  Future<void> _onGetNextQuestionRequested(
      GetNextMistakeRequested event, Emitter<MistakeState> emit) async {
    if (isFetchingNextPage) return;

    if (state is MistakeInitial || state is MistakeError) {
      emit(MistakeLoading());
    } else if (state is MistakeLoaded) {
      isFetchingNextPage = true;
      emit(MistakeNextPageLoading((state as MistakeLoaded).questions));
    }

    final questionsOrFailure = await getMistakes(params: NoParams());

    questionsOrFailure.fold(
      (failure) {
        var errorMessage = "";
        if (failure is ServerFailure) {
          errorMessage = failure.message;
        } else if (failure is NetworkFailure) {
          errorMessage = "Please check your network connection";
        } else {
          errorMessage = "An unknown error occurred";
        }
        emit(MistakeError(message: errorMessage));
        isFetchingNextPage = false;
      },
      (questions) {
        // log(questions.isEmpty ? 'Empty set' : '$questions');
        if (state is MistakeLoaded || state is MistakeNextPageLoading) {
          final currentQuestions = (state as MistakeLoaded).questions;
          final List<Question> updatedQuestions = List.from(currentQuestions)
            ..addAll(questions);

          emit(MistakeNextPageLoaded(questions));
          emit(MistakeLoaded(questions: updatedQuestions));
        } else {
          //   log('bloc ${questions.first.question}');
          emit(MistakeLoaded(questions: questions));
        }
        isFetchingNextPage = false;
      },
    );
  }
}
