import 'dart:async';
import 'package:dio/dio.dart';
import 'package:kz_h/src/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:kz_h/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:kz_h/src/features/auth/domain/entiities/auth_info.dart';

class AuthInterceptor extends Interceptor {
  final AuthLocalDataSource _localDataSource;
  final AuthRemoteDataSource _authRemoteDataSource;
  final Dio _dio;

  bool _isRefreshing = false;
  Completer<void>? _refreshCompleter;

  AuthInterceptor(
    this._localDataSource,
    this._authRemoteDataSource,
    this._dio,
  );

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _localDataSource.getAccessToken();
    if (accessToken != null) {
      options.headers["Authorization"] = "Bearer $accessToken";
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    // Only intercept 401 errors
    if (err.response?.statusCode == 401) {
      final requestOptions = err.requestOptions;

      // If no refresh is in progress, start one.
      if (!_isRefreshing) {
        _isRefreshing = true;
        _refreshCompleter = Completer<void>();

        try {
          final refreshToken = await _localDataSource.getRefreshToken();
          if (refreshToken == null) {
            // No refresh token available, propagate error.
            handler.next(err);
            return;
          }

          // Attempt to refresh the token.
          final AuthInfo authInfo = await _authRemoteDataSource.refresh(
              refreshToken: refreshToken);

          // Save the new tokens in your local data source.
          await _localDataSource.saveAccessToken(authInfo.accessToken);
          await _localDataSource.saveRefreshToken(authInfo.refreshToken);

          // Complete the completer to notify any waiting requests.
          _refreshCompleter?.complete();

          requestOptions.headers["Authorization"] =
              "Bearer ${authInfo.accessToken}";

          final response = await _dio.fetch(requestOptions);
          handler.resolve(response);
        } catch (refreshError) {
          _refreshCompleter?.completeError(refreshError);
          handler.reject(refreshError is DioException
              ? refreshError
              : DioException(
                  requestOptions: requestOptions, error: refreshError));
        } finally {
          _isRefreshing = false;
          _refreshCompleter = null;
        }
      } else {
        try {
          await _refreshCompleter?.future;

          final newAccessToken = await _localDataSource.getAccessToken();
          requestOptions.headers["Authorization"] = "Bearer $newAccessToken";

          final response = await _dio.fetch(requestOptions);
          handler.resolve(response);
        } catch (error) {
          handler.reject(error is DioException
              ? error
              : DioException(requestOptions: requestOptions, error: error));
        }
      }
    } else {
      handler.next(err);
    }
  }
}
