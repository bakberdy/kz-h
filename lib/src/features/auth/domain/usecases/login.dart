import 'dart:nativewrappers/_internal/vm/lib/mirrors_patch.dart';

import 'package:dartz/dartz.dart';
import 'package:kz_h/src/core/usecase/usecase.dart';
import 'package:kz_h/src/features/auth/domain/entiities/auth_info.dart';
import 'package:kz_h/src/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/failures.dart';

class Login implements UseCase<Either<Failure, AuthInfo>, LoginParams>{
  final AuthRepository repository;

  Login(this.repository);
  @override
  Future<Either<Failure, AuthInfo>> call({required LoginParams params}) {
 return repository.login(email: params.usernameOrEmail, password: params.password);
  }
}


class LoginParams{
  final String usernameOrEmail;
  final String password;

  LoginParams({required this.usernameOrEmail, required this.password});
}