import 'package:dartz/dartz.dart';

import 'package:kz_h/src/core/error/failures.dart';
import 'package:kz_h/src/features/home_feed/data/data_sources/question_remote_data_source.dart';
import 'package:kz_h/src/features/home_feed/data/models/question_model.dart';

import 'package:kz_h/src/features/home_feed/domain/entities/question.dart';
import 'package:kz_h/src/features/home_feed/domain/entities/variant.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/questions_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionRemoteDataSource questionRemoteDataSource;
  final NetworkInfo networkInfo;

  QuestionRepositoryImpl(
      {required this.networkInfo, required this.questionRemoteDataSource});

  @override
  Future<Either<Failure, List<Question>>> getQuestions() async {
    if (await networkInfo.isConnected) {
      try {
        final List<QuestionModel> questions =
            await questionRemoteDataSource.getQuestions();
        // print('repa impl ${questions.first.question}');
        return Right(questions);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Variant>>> answerToQuestion(
      String quesitonId, String selectedOption) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await questionRemoteDataSource.answerToQuestion(
            quesitonId, selectedOption));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Variant>>> answerToMistake(
      String quesitonId, String selectedOption) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await questionRemoteDataSource.answerToMistake(
            quesitonId, selectedOption));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Question>>> getMistakes() async {
    if (await networkInfo.isConnected) {
      try {
        final List<QuestionModel> questions =
            await questionRemoteDataSource.getMistakes();
        // print('repa impl ${questions.first.question}');
        return Right(questions);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
