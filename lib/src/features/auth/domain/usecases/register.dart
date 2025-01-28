import 'package:dartz/dartz.dart';
import 'package:kz_h/src/core/usecase/usecase.dart';
import 'package:kz_h/src/features/auth/domain/entiities/user.dart';
import 'package:kz_h/src/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/failures.dart';

class RegisterParams{
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterParams({required this.username, required this.email, required this.password, required this.confirmPassword});
}

class Register implements UseCase<Either<Failure, User>, RegisterParams>{
  final AuthRepository repository;
  Register(this.repository);
  @override
  Future<Either<Failure, User>> call({required RegisterParams params}) {
    return repository.register(username: params.username, password: params.password, confirmPassword: params.confirmPassword, email: params.email);
  }

}