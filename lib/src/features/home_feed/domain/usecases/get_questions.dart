import 'package:dartz/dartz.dart';
import 'package:kz_h/src/core/error/failures.dart';
import 'package:kz_h/src/core/usecase/usecase.dart';
import 'package:kz_h/src/features/home_feed/domain/entities/question.dart';
import 'package:kz_h/src/features/home_feed/domain/repositories/questions_repository.dart';

class GetQuestions
    implements UseCase<Either<Failure, List<Question>>, int> {
  final QuestionRepository repository;

  GetQuestions(this.repository);

  @override
  Future<Either<Failure, List<Question>>> call({required int params}) {
    return repository.getQuestions(params);
  }
}
