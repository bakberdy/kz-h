import 'package:dartz/dartz.dart';
import 'package:kz_h/src/core/usecase/usecase.dart';
import 'package:kz_h/src/features/auth/domain/entiities/user.dart';
import 'package:kz_h/src/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/failures.dart';

class GetUserInfo implements UseCase<Either<Failure, User>, String>{
  final AuthRepository repository;

  GetUserInfo(this.repository);
  @override
  Future<Either<Failure, User>> call({required String params}) {
    return repository.getUserInfo(accessToken: params);
  }
}