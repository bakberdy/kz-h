import 'package:dartz/dartz.dart';
import 'package:kz_h/src/core/error/failures.dart';
import 'package:kz_h/src/core/usecase/usecase.dart';
import 'package:kz_h/src/features/auth/domain/repositories/auth_repository.dart';

class LogOut implements UseCase<Either<Failure, void>, NoParams>{
  final AuthRepository repository;

  LogOut(this.repository);

  @override
  Future<Either<Failure, void>> call({required NoParams params}) {
    return repository.logOut();
  }

}