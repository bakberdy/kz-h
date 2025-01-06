import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kz_h/src/core/error/failures.dart';
import 'package:kz_h/src/features/home_feed/domain/usecases/get_questions.dart';

import '../../../domain/entities/question.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final GetQuestions getQuestions;

  bool isFetchingNextPage = false; // Флаг для предотвращения повторного запроса

  QuestionBloc({required this.getQuestions}) : super(QuestionInitial()) {
    on<GetQuestionRequested>(_onGetQuestionRequested);
  }

  Future<void> _onGetQuestionRequested(
      GetQuestionRequested event, Emitter<QuestionState> emit) async {    
    // Если мы уже загружаем следующую страницу, игнорируем новый запрос
    if (isFetchingNextPage) return;

    if (state is QuestionInitial || state is QuestionError) {
      // Первая загрузка
      emit(QuestionLoading());
    } else if (state is QuestionLoaded) {
      // Загрузка следующей страницы
      isFetchingNextPage = true;
      emit(NextPageLoading((state as QuestionLoaded).questions));
    }

    final questionsOrFailure = await getQuestions(params: event.pageIndex);

    questionsOrFailure.fold(
      (failure) {
        var errorMessage = "";
        if (failure is ServerFailure) {
          errorMessage = "Error on the server side";
        } else if (failure is NetworkFailure) {
          errorMessage = "Please check your network connection";
        } else {
          errorMessage = "An unknown error occurred";
        }
        emit(QuestionError(message: errorMessage));
        isFetchingNextPage = false;
      },
      (questions) {
        if (state is QuestionLoaded || state is NextPageLoading) {
          final currentQuestions = (state as QuestionLoaded).questions;
          final List<Question> updatedQuestions =
              List.from(currentQuestions)..addAll(questions);
          emit(QuestionLoaded(questions: updatedQuestions));
        } else {
          emit(QuestionLoaded(questions: questions));
        }
        isFetchingNextPage = false;
      },
    );
  }
}
