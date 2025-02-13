import 'package:dio/dio.dart';
import 'package:kz_h/src/core/error/exceptions.dart';

class DioClient {
  final Dio dio;

  DioClient({required this.dio});

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Object? data}) async {
    return _exceptionChecker(() async {
      final response = await dio.get(path,
          queryParameters: queryParameters,
          options: Options(headers: headers),
          data: data);

      return response;
    });
  }

  Future<Response> post(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Object? data}) async {
    return _exceptionChecker(() async {
      final response = await dio.post(path,
          queryParameters: queryParameters,
          options: Options(headers: headers),
          data: data);

      return response;
    });
  }

  Future<T> _exceptionChecker<T>(Future<T> Function() body) async {
    try {
      return await body();
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
        throw ServerException('Please check your internet connection and try again');
      }
    } catch (e) {
      rethrow;
    }
  }
}
