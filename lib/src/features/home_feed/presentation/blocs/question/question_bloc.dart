
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kz_h/src/core/error/failures.dart';
import 'package:kz_h/src/core/usecase/usecase.dart';
import 'package:kz_h/src/features/home_feed/domain/usecases/get_questions.dart';

import '../../../domain/entities/question.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final GetQuestions getQuestions;
  QuestionBloc({required this.getQuestions}) : super(QuestionInitial()) {
    on<GetQuestionRequested>((event, emit) async {
      emit(QuestionLoading());
      final questionsOrFailure= await getQuestions(params: NoParams());
      questionsOrFailure.fold((failure) {
        var errorMessage = "";
        if(failure is ServerFailure){
          errorMessage = "Error in server side";
        }else if(failure is NetworkFailure){
          errorMessage = "Please check your network connection";
        }else{
          errorMessage = "Unknown error occurred";
        }
      }, (questions) {
        if (state is QuestionLoaded) {
          final currentQuestions = (state as QuestionLoaded).questions;
          final List<Question> updatedQuestions = List.from(currentQuestions)..addAll(questions);
          emit(QuestionLoaded(questions: updatedQuestions));
        } else {
          emit(QuestionLoaded(questions: questions));
        }
        emit(QuestionLoaded(questions: questions));
      });
    });
  }
}
