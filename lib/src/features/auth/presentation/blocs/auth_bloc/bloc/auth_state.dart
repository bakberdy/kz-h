part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class Authenticated extends AuthState{
  final User user;

  const Authenticated( {required this.user});
}
final class UnAuthenticated extends AuthState{}

final class AuthError extends AuthState{
  final String message;

  const AuthError(this.message);
}

final class AuthLoading extends AuthState{}
