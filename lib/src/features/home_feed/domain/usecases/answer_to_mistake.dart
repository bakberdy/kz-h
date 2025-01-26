import 'package:dartz/dartz.dart';
import 'package:kz_h/src/core/error/failures.dart';
import 'package:kz_h/src/core/usecase/usecase.dart';
import 'package:kz_h/src/features/home_feed/domain/entities/variant.dart';
import 'package:kz_h/src/features/home_feed/domain/repositories/questions_repository.dart';

class AnswerToMistake implements UseCase<Either<Failure, List<Variant>>,AnswerParams>{
  final QuestionRepository repository;

  AnswerToMistake(this.repository);
  @override
  Future<Either<Failure, List<Variant>>> call({required AnswerParams params}) {
    return repository.answerToMistake(params.mistakeQuestionId, params.selectedOption);
  }
}

class AnswerParams {
  final String mistakeQuestionId;
  final String selectedOption;

  AnswerParams({required this.mistakeQuestionId, required this.selectedOption});
}