part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}



class LoginRequested extends AuthEvent{
  final String emailOrUsername;
  final String password;

  const LoginRequested({required this.emailOrUsername, required this.password});
}

class RegisterRequested extends AuthEvent{
  final String email;
  final String password;
  final String confirmPassword;
  final String username;

  const RegisterRequested({required this.email, required this.password, required this.confirmPassword, required this.username});
}

class LogOutRequested extends AuthEvent{}
