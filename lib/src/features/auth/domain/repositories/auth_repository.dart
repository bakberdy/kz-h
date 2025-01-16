import 'package:dartz/dartz.dart';
import 'package:kz_h/src/core/error/failures.dart';
import 'package:kz_h/src/features/auth/domain/entiities/auth_info.dart';
import 'package:kz_h/src/features/auth/domain/entiities/user.dart';

abstract interface class AuthRepository {
    Future<Either<Failure, AuthInfo>> login({required String email,required String password});
    Future<Either<Failure, AuthInfo>> register({required String username, required String password, required String confirmPassword, required String email});
    Future<Either<Failure, User>> getUserInfo({required String accessToken});
    Future<Either<Failure, String>> refresh({required String refreshToken});
}