import 'package:dartz/dartz.dart';

import 'package:kz_h/src/core/error/failures.dart';
import 'package:kz_h/src/features/home_feed/data/data_sources/question_remote_data_source.dart';
import 'package:kz_h/src/features/home_feed/data/models/question_model.dart';

import 'package:kz_h/src/features/home_feed/domain/entities/question.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/questions_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionRemoteDataSource questionRemoteDataSource;
  final NetworkInfo networkInfo;

  QuestionRepositoryImpl(
      {required this.networkInfo, required this.questionRemoteDataSource});

  @override
  Future<Either<Failure, List<Question>>> getQuestions(int params) async {
    if (await networkInfo.isConnected) {
      try {
        final List<QuestionModel> questions =
            await questionRemoteDataSource.getQuestions();
        return Right(questions);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
