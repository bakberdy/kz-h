import 'package:dartz/dartz.dart';
import 'package:kz_h/src/core/error/failures.dart';
import 'package:kz_h/src/features/auth/domain/entiities/user.dart';

abstract interface class AuthRepository {
    Future<Either<Failure, User>> login({required String email,required String password});
    Future<Either<Failure, User>> register({required String username, required String password, required String confirmPassword, required String email});
    Future<Either<Failure, User>> getUserInfo();
    Future<Either<Failure, void>> logOut();
    Future<bool> isLogined();
}