import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kz_h/src/core/usecase/usecase.dart';
import 'package:kz_h/src/features/auth/domain/entiities/user.dart';
import 'package:kz_h/src/features/auth/domain/usecases/get_user_info.dart';
import 'package:kz_h/src/features/auth/domain/usecases/log_out.dart';
import 'package:kz_h/src/features/auth/domain/usecases/login.dart';
import 'package:kz_h/src/features/auth/domain/usecases/refresh.dart';
import 'package:kz_h/src/features/auth/domain/usecases/register.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetUserInfo getUserInfo;
  final Login login;
  final Register register;
  final Refresh refresh;
  final LogOut logOut;


  AuthBloc( {
    required this.logOut,
    required this.getUserInfo,
    required this.login,
    required this.register,
    required this.refresh,
  }) : super(AuthInitial()) {

    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());

      final failureOrSuccess = await login(
          params: LoginParams(
        usernameOrEmail: event.emailOrUsername,
        password: event.password,
      ));

      failureOrSuccess.fold(
        (failure) {
          emit(AuthError(failure.message));
          emit(UnAuthenticated());
        },
        (success) {
          emit(Authenticated(user: success));
        },
      );
    });


    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());

      final failureOrSuccess = await register(
          params: RegisterParams(
        password: event.password,
        username: event.username,
        email: event.email,
        confirmPassword: event.confirmPassword,
      ));

      failureOrSuccess.fold(
        (failure) {
          emit(AuthError(failure.message));
          emit(UnAuthenticated());
        },
        (success) {
          emit(Authenticated(user: success));
        },
      );
    });

    on<LogOutRequested>((event, emit) async {
      emit(AuthLoading());

      await logOut(params:  NoParams());

      emit(UnAuthenticated());

    });
  }
}
