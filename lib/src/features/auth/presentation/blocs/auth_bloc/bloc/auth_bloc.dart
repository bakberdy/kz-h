import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kz_h/src/core/usecase/usecase.dart';
import 'package:kz_h/src/features/auth/domain/entiities/user.dart';
import 'package:kz_h/src/features/auth/domain/usecases/get_user_info.dart';
import 'package:kz_h/src/features/auth/domain/usecases/log_out.dart';
import 'package:kz_h/src/features/auth/domain/usecases/login.dart';
import 'package:kz_h/src/features/auth/domain/usecases/register.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetUserInfoUseCase getUserInfo;
  final Login login;
  final Register register;
  final LogOut logOut;

  AuthBloc({
    required this.logOut,
    required this.getUserInfo,
    required this.login,
    required this.register,
  }) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());

      final failureOrSuccess = await login(
          params: LoginParams(
        usernameOrEmail: event.emailOrUsername,
        password: event.password,
      ));
      

      //await Future.delayed(const Duration(seconds: 10));

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

      final lastState = state;

      final fOrS = await logOut(params: NoParams());
      fOrS.fold((failure) {
        emit(AuthError(failure.message));
        emit(lastState);
      }, (success) => emit(UnAuthenticated()));
      emit(UnAuthenticated());
    });
    on<GetUserInfoRequested>((event, emit) async {
      emit(AuthLoading());

      final failureOrSuccess = await getUserInfo(params: NoParams());

      //await Future.delayed(const Duration(seconds: 10));

      failureOrSuccess.fold(
        (failure) {
          emit(AuthError(failure.message));
          emit(UnAuthenticated());
        },
        (success) {
          print('Current user $success');
          emit(Authenticated(user: success));
        },
      );
    });
  }
}
