import 'package:dio/dio.dart';
import 'package:kz_h/src/core/error/exceptions.dart';
import 'package:kz_h/src/features/auth/domain/entiities/auth_info.dart';
import 'package:kz_h/src/features/auth/domain/entiities/user.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthInfo> login(
      {required String emailOrUsername, required String password});
  Future<void> register({
    required String email,
    required String username,
    required String password,
    required String confirmPassword,
  });
  Future<String> refresh({required String refreshToken});
  Future<User> getUserInfo({required String accessToken});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final URL = 'http://185.32.84.190/api/auth';
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<AuthInfo> login(
      {required String emailOrUsername, required String password}) async {
    try {
      final response = await dio.post('$URL/login', data: {
        "emailOrUsername": emailOrUsername,
        "password": password,
      });

      if (response.statusCode == 200) {
        final data = response.data as Map;
        final String accessToken = data['access_token'];
        final String refreshToken = data['refresh_token'];

        if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
          final authInfo =
              AuthInfo(refreshToken: refreshToken, accessToken: accessToken);
          return authInfo;
        } else {
          throw AuthException('Access token is empty');
        }
      } else {
        throw ServerException('Unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> refresh({required String refreshToken}) async {
    try {
      final response = await dio.post('$URL/refresh',
          options: Options(headers: {"Authorization": 'Bearer $refreshToken'}));

      if (response.statusCode == 200) {
        final data = response.data as Map;
        final String accessToken = data['access_token'];

        if (accessToken.isNotEmpty) {
          return accessToken;
        } else {
          throw AuthException('Access token is empty');
        }
      } else {
        throw ServerException('Unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> register(
      {required String email,
      required String username,
      required String password,
      required String confirmPassword}) async {
    try {
      final response = await dio.post(URL + '/register', data: {
        "username": username,
        "password": password,
        "confirm_password": confirmPassword,
        "email": email
      });
      if (response.statusCode == 200) {
        return;
      } else {
        throw ServerException('Unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> getUserInfo({required String accessToken}) async {
    try {
      final response = await dio.post('$URL/me',
          options: Options(headers: {"Authorization": 'Bearer $accessToken'}));

      if (response.statusCode == 200) {
        final data = response.data as Map;
        final User user = User.fromJson(data as Map<String, dynamic>);

        return user;
      } else {
        throw ServerException('Unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
