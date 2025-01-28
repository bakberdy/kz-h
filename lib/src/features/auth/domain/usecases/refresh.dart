import 'package:dartz/dartz.dart';

import 'package:kz_h/src/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class Refresh implements UseCase<Either<Failure, String>, NoParams>{
  final AuthRepository repository;

  Refresh(this.repository);

  @override
  Future<Either<Failure, String>> call({required NoParams params}) {
    return repository.refresh();
  }
}