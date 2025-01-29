import 'package:dartz/dartz.dart';
import 'package:kz_h/src/core/error/exceptions.dart';
import 'package:kz_h/src/core/error/failures.dart';
import 'package:kz_h/src/core/network/network_info.dart';
import 'package:kz_h/src/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:kz_h/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:kz_h/src/features/auth/domain/entiities/auth_info.dart';
import 'package:kz_h/src/features/auth/domain/entiities/user.dart';
import 'package:kz_h/src/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {required this.networkInfo,
      required this.authRemoteDataSource,
      required this.authLocalDataSource});

  @override
  Future<Either<Failure, User>> getUserInfo() async {
    return _handleError(() async {
      final accessToken = await authLocalDataSource.getAccessToken();
      final User user =
          await authRemoteDataSource.getUserInfo(accessToken: accessToken);
      return user;
    });
  }

  @override
  Future<Either<Failure, User>> login(
      {required String email, required String password}) async {
    return _handleError(() async {
      final AuthInfo userInfo = await authRemoteDataSource.login(
          emailOrUsername: email, password: password);
      await authLocalDataSource.saveAccessToken(userInfo.accessToken);
      await authLocalDataSource.saveRefreshToken(userInfo.refreshToken);
      final user = await authRemoteDataSource.getUserInfo(
          accessToken: userInfo.accessToken);
      return user;
    });
  }

  @override
  Future<Either<Failure, String>> refresh() async {
    return _handleError(() async {
      final String refreshToken = await authLocalDataSource.getRefreshToken();
      final String accessToken =
          await authRemoteDataSource.refresh(refreshToken: refreshToken);
      await authLocalDataSource.saveAccessToken(accessToken);
      return accessToken;
    });
  }

  @override
  Future<Either<Failure, User>> register(
      {required String username,
      required String password,
      required String confirmPassword,
      required String email}) async {
    return _handleError(() async {
      await authRemoteDataSource.register(
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          username: username);
      final AuthInfo userInfo = await authRemoteDataSource.login(
          emailOrUsername: email, password: password);
      await authLocalDataSource.saveAccessToken(userInfo.accessToken);
      await authLocalDataSource.saveRefreshToken(userInfo.refreshToken);
      final user = await authRemoteDataSource.getUserInfo(
          accessToken: userInfo.accessToken);
      return user;
    });
  }

  @override
  Future<void> logOut() async {
    await authLocalDataSource.deleteAllTokens();
    await authRemoteDataSource.logOut();
  }

  @override
  Future<bool> isLogined() {
    throw UnimplementedError();
  }

  Future<Either<Failure, T>> _handleError<T>(Future<T> Function() body) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await body());
      } catch (e) {
        if (e is ServerException) {
          return Left(ServerFailure(e.message));
        } else if (e is TokenNotFoundException) {
          return Left(CacheFailure(e.message));
        } else {
          return Left(AuthFailure(e.toString()));
        }
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
