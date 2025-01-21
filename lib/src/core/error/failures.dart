import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure([this.message = 'Failed']);
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure([this.message = 'Server error']);
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  final String message;

  NetworkFailure([this.message = 'Network connection error']);
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  final String message;
  CacheFailure([this.message = 'Cache error']);
  @override
  List<Object?> get props => [];
}

class AuthFailure extends Failure {
  final String message;
  AuthFailure([this.message = 'Auth error']);
  @override
  List<Object?> get props => [];
}
