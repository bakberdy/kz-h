import 'dart:convert';
import 'dart:developer';

import 'package:kz_h/src/core/dio/dio_client.dart';
import 'package:kz_h/src/core/utils/get_device_info.dart';
import 'package:kz_h/src/features/auth/data/data_sources/auth_local_data_source.dart';
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
  Future<AuthInfo> refresh({required String refreshToken});
  Future<User> getUserInfo({required String accessToken});
  Future<void> logOut({required String accessToken});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl({required this.dioClient});

  @override
Future<AuthInfo> login({
  required String emailOrUsername,
  required String password,
}) async {

  try {
    final deviceInfo = await getDeviceInfo();

    final response = await dioClient.post(
      headers: {'User-agent': deviceInfo},
      '/auth/login',
      data: {
        "emailOrUsername": emailOrUsername,
        "password": password,
      },
    );

    final data = response.data as Map<String, dynamic>;
    final String accessToken = data['access_token'] as String;
    final String refreshToken = data['refresh_token'] as String;


    return AuthInfo(refreshToken: refreshToken, accessToken: accessToken);
  } catch (e) {
    rethrow; 
  }
}

  @override
  Future<AuthInfo> refresh({required String refreshToken}) async {
    final deviceInfo = await getDeviceInfo();
    final response = await dioClient.post('/auth/refresh', headers: {
      "Authorization": 'Bearer $refreshToken',
      "User-agent": deviceInfo
    });

    final data = response.data as Map;
    final String accessToken = data[ACCESS_TOKEN];
    final String newRefreshToken = data[REFRESH_TOKEN];
    return AuthInfo(refreshToken: newRefreshToken, accessToken: accessToken);
  }

  @override
  Future<void> register({
    required String email,
    required String username,
    required String password,
    required String confirmPassword,
  }) async {
    await dioClient.post('/auth/register',
        data: jsonEncode({
          "username": username,
          "password": password,
          "confirm_password": confirmPassword,
          "email": email
        }),
        headers: {"Content-Type": "application/json"});
  }

  @override
  Future<User> getUserInfo({required String accessToken}) async {
    final response = await dioClient
        .get('/auth/me', headers: {"Authorization": 'Bearer $accessToken'});
    return User.fromJson(response.data as Map<String, dynamic>);
  }
  
  @override
  Future<void> logOut({required String accessToken}) async{
   await dioClient.get('/auth/logout', headers: {"Authorization": 'Bearer $accessToken'});
  }
}
