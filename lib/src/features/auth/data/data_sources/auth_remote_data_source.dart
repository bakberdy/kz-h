import 'dart:convert';
import 'dart:developer';

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
  Future<AuthInfo> login({
    required String emailOrUsername,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '$URL/login',
        data: {
          "emailOrUsername": emailOrUsername,
          "password": password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // log('Login success');
        final data = response.data as Map<String, dynamic>;

        final accessToken = data['access_token'] as String?;
        final refreshToken = data['refresh_token'] as String?;

        if (accessToken != null &&
            accessToken.isNotEmpty &&
            refreshToken != null &&
            refreshToken.isNotEmpty) {
          return AuthInfo(
            refreshToken: refreshToken,
            accessToken: accessToken,
          );
        } else {
          throw AuthException('Access token or refresh token is empty.');
        }
      } else {
        throw ServerException(
          'Unexpected status code: ${response.statusCode}, Response: ${response.data}',
        );
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        final statusCode = dioError.response?.statusCode;
        final errorData =
            dioError.response?.data?['message'] ?? 'Unknown error';

        if (statusCode == 404) {
          throw ServerException('Resource not found: $errorData');
        } else if (statusCode == 500) {
          throw ServerException('Internal server error: $errorData');
        } else {
          throw ServerException('Error $statusCode: $errorData');
        }
      } else {
        throw ServerException('Network error: ${dioError.message}');
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

      if (response.statusCode == 200 || response.statusCode == 201) {
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
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        final statusCode = dioError.response?.statusCode;
        final errorData =
            dioError.response?.data?['message'] ?? 'Unknown error';

        if (statusCode == 404) {
          throw ServerException('Resource not found: $errorData');
        } else if (statusCode == 500) {
          throw ServerException('Internal server error: $errorData');
        } else {
          throw ServerException('Error $statusCode: $errorData');
        }
      } else {
        throw ServerException('Network error: ${dioError.message}');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> register({
    required String email,
    required String username,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await dio.post(
        '$URL/register',
        data: jsonEncode({
          "username": username,
          "password": password,
          "confirm_password": confirmPassword,
          "email": email,
        }),
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      } else {
        throw ServerException('Unexpected status code: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        final statusCode = dioError.response?.statusCode;
        final errorData =
            dioError.response?.data?['message'] ?? 'Unknown error';

        if (statusCode == 404) {
          throw ServerException('Resource not found: $errorData');
        } else if (statusCode == 500) {
          throw ServerException('Internal server error: $errorData');
        } else {
          throw ServerException('Error $statusCode: $errorData');
        }
      } else {
        throw ServerException('Network error: ${dioError.message}');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> getUserInfo({required String accessToken}) async {
    try {
      final response = await dio.get(
        '$URL/me',
        options: Options(
          headers: {
            "Authorization": 'Bearer $accessToken',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;
        return User.fromJson(data);
      } else {
        throw ServerException(
          'Unexpected status code: ${response.statusCode}, Response: ${response.data}',
        );
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        final statusCode = dioError.response?.statusCode;
        final errorData =
            dioError.response?.data?['message'] ?? 'Unknown error';

        if (statusCode == 404) {
          throw ServerException('Resource not found: $errorData');
        } else if (statusCode == 500) {
          throw ServerException('Internal server error: $errorData');
        } else {
          throw ServerException('Error $statusCode: $errorData');
        }
      } else {
        throw ServerException('Network error: ${dioError.message}');
      }
    } catch (e) {
      // print('Error in getUserInfo: $e');
      rethrow;
    }
  }
}
