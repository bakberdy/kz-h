import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get message;

  const Failure();
}

class ServerFailure extends Failure {
  final String _message;
  @override
  String get message => _message;

  const ServerFailure([this._message = 'Server error']);
  @override
  List<Object?> get props => [_message];
}

class NetworkFailure extends Failure {
  final String _message;
  @override
  String get message => _message;

  const NetworkFailure([this._message = 'Network connection error']);
  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  final String _message;
  @override
  String get message => _message;
  const CacheFailure([this._message = 'Cache error']);
  @override
  List<Object?> get props => [_message];
}

class AuthFailure extends Failure {
  final String _message;
  @override
  String get message => _message;

  const AuthFailure([this._message = 'Auth error']);
  @override
  List<Object?> get props => [_message];
}
