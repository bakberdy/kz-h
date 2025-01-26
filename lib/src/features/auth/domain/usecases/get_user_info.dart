import 'package:dartz/dartz.dart';
import 'package:kz_h/src/core/usecase/usecase.dart';
import 'package:kz_h/src/features/auth/domain/entiities/user.dart';
import 'package:kz_h/src/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/failures.dart';

class GetUserInfoUseCase implements UseCase<Either<Failure, User>, NoParams>{
  final AuthRepository repository;

  GetUserInfoUseCase(this.repository);
  @override
  Future<Either<Failure, User>> call({required NoParams params}) {
    return repository.getUserInfo();
  }
}