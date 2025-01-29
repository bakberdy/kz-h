class ServerException implements Exception {
  final String message;

  ServerException([this.message = 'Server error']);
  @override
  String toString() => message;
}

class CacheException implements Exception {
  final String message;

  CacheException([this.message = 'Cache error']);
  @override
  String toString() => message;
}

class TokenNotFoundException implements Exception {
  final String message;
  TokenNotFoundException([this.message = 'Token not found']);
  @override
  String toString() => message;
}

class AuthException implements Exception {
  final String message;
  AuthException([this.message = 'Auth']);
  @override
  String toString() => message;
}

class TokenInspiredException implements Exception{
  final String message;

  TokenInspiredException([this.message='Token inspired']);
}
