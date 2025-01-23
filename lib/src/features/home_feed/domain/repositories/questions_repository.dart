import 'package:dartz/dartz.dart';
import 'package:kz_h/src/core/error/failures.dart';
import 'package:kz_h/src/features/home_feed/domain/entities/question.dart';
import 'package:kz_h/src/features/home_feed/domain/entities/variant.dart';

abstract interface class QuestionRepository{
  Future<Either<Failure, List<Question>>> getQuestions();
  Future<Either<Failure, List<Variant>>> answerToQuestion(String quesitonId, String selectedOption);
}