import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:kz_h/src/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:kz_h/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:kz_h/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:kz_h/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:kz_h/src/features/auth/domain/usecases/get_user_info.dart';
import 'package:kz_h/src/features/auth/domain/usecases/log_out.dart';
import 'package:kz_h/src/features/auth/domain/usecases/login.dart';
import 'package:kz_h/src/features/auth/domain/usecases/refresh.dart';
import 'package:kz_h/src/features/auth/domain/usecases/register.dart';
import 'package:kz_h/src/features/auth/presentation/blocs/auth_bloc/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initAuthDi() async{
  //data
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<FlutterSecureStorage>(()=>const FlutterSecureStorage());
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(storage: sl()));

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      networkInfo: sl(),
      authRemoteDataSource: sl(),
      authLocalDataSource: sl()));

  //domain
  sl.registerLazySingleton(() => GetUserInfo(sl()));
  sl.registerLazySingleton(() => LogOut(sl()));
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => Refresh(sl()));
  sl.registerLazySingleton(() => Register(sl()));

  //presentation
  sl.registerFactory(() => AuthBloc(
      logOut: sl(),
      getUserInfo: sl(),
      login: sl(),
      register: sl(),
      refresh: sl()));
}
