import 'package:dartz/dartz.dart';
import 'package:kz_h/src/core/error/failures.dart';
import 'package:kz_h/src/core/usecase/usecase.dart';
import 'package:kz_h/src/features/home_feed/domain/entities/variant.dart';
import 'package:kz_h/src/features/home_feed/domain/repositories/questions_repository.dart';

class AnswerToQuestion implements UseCase<Either<Failure, List<Variant>>, AnswerParams>{
  final QuestionRepository repository;

  AnswerToQuestion(this.repository);
  @override
  Future<Either<Failure, List<Variant>>> call({required AnswerParams params}) {
    return repository.answerToQuestion(params.questionId, params.selectedOption);
  }

}

class AnswerParams{
  final String questionId;
  final String selectedOption;

  AnswerParams({required this.questionId, required this.selectedOption});
}