import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kz_h/src/core/error/exceptions.dart';

abstract interface class AuthLocalDataSource {
  Future<void> saveAccessToken(String accessToken);
  Future<String> getAccessToken();
  Future<void> saveRefreshToken(String refreshToken);
  Future<String> getRefreshToken();
  Future<void> deleteAllTokens();
}

const ACCESS_TOKEN = 'accessToken';
const REFRESH_TOKEN = 'refreshToken';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage _storage;

  AuthLocalDataSourceImpl({required FlutterSecureStorage storage})
      : _storage = storage;

  @override
  Future<String> getAccessToken() async {
    final String? token = await _storage.read(key: ACCESS_TOKEN);
    if (token != null) {
      return token;
    } else {
      throw TokenNotFoundException("Access token not found");
    }
  }

  @override
  Future<String> getRefreshToken() async {
    final String? token = await _storage.read(key: REFRESH_TOKEN);
    if (token != null) {
      return token;
    } else {
      throw TokenNotFoundException("Refresh token not found");
    }
  }

  @override
  Future<void> saveAccessToken(String accessToken) async {
    await _storage.write(key: ACCESS_TOKEN, value: accessToken);
  }

  @override
  Future<void> saveRefreshToken(String refreshToken) async {
    await _storage.write(key: ACCESS_TOKEN, value: refreshToken);
  }

  @override
  Future<void> deleteAllTokens() async {
    await _storage.deleteAll();
  }
}
