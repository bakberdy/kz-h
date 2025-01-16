import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:kz_h/src/core/network/network_info.dart';
import 'package:kz_h/src/core/usecase/usecase.dart';
import 'package:kz_h/src/features/home_feed/data/data_sources/question_remote_data_source.dart';
import 'package:kz_h/src/features/home_feed/data/repositories/question_repository_impl.dart';
import 'package:kz_h/src/features/home_feed/domain/repositories/questions_repository.dart';
import 'package:kz_h/src/features/home_feed/domain/usecases/get_questions.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/home_screen_pages/home_screen_pages_cubit.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/question/question_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/variant/variant_bloc.dart';

final sl = GetIt.instance;

Future<void> initHomeDi() async {
  // Core
  sl.registerLazySingleton(() => Connectivity());
  sl.registerSingleton<NetworkInfo>(
      NetworkInfoImpl(connectionChecker: sl())); // NetworkInfo зависит от DataConnectionChecker

  // Data Layer
  sl.registerLazySingleton<QuestionRemoteDataSource>(
      () => QuestionRemoteDataSourceImpl());
  sl.registerLazySingleton<QuestionRepository>(() => QuestionRepositoryImpl(
        networkInfo: sl(),
        questionRemoteDataSource: sl(),
      ));

  // Domain Layer
  sl.registerLazySingleton(() => GetQuestions(sl()));

  // Presentation Layer
  sl.registerFactory(() => QuestionBloc(getQuestions: sl()));
  sl.registerFactory(()=> HomeScreenPagesCubit());
  sl.registerFactory(()=> VariantBloc());
}

