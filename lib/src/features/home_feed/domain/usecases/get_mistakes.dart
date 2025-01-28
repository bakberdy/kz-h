import 'package:dartz/dartz.dart';
import 'package:kz_h/src/core/error/failures.dart';
import 'package:kz_h/src/core/usecase/usecase.dart';
import 'package:kz_h/src/features/home_feed/domain/entities/question.dart';
import 'package:kz_h/src/features/home_feed/domain/repositories/questions_repository.dart';

class GetMistakes implements UseCase<Either<Failure, List<Question>>, NoParams>{
  final QuestionRepository repository;

  GetMistakes(this.repository);
  @override
  Future<Either<Failure, List<Question>>> call({required NoParams params}) {
    return repository.getMistakes();
  }
}