import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kz_h/src/core/network/network_info.dart';
import 'package:kz_h/src/core/usecase/usecase.dart';
import 'package:kz_h/src/features/home_feed/data/data_sources/question_remote_data_source.dart';
import 'package:kz_h/src/features/home_feed/data/repositories/question_repository_impl.dart';
import 'package:kz_h/src/features/home_feed/domain/repositories/questions_repository.dart';
import 'package:kz_h/src/features/home_feed/domain/usecases/answer_to_mistake.dart';
import 'package:kz_h/src/features/home_feed/domain/usecases/answer_to_question.dart';
import 'package:kz_h/src/features/home_feed/domain/usecases/get_mistakes.dart';
import 'package:kz_h/src/features/home_feed/domain/usecases/get_questions.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/home_screen_pages/home_screen_pages_cubit.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/mistakes/mistake_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/question/question_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/variant/variant_bloc.dart';

final sl = GetIt.instance;

Future<void> initHomeDi() async {
  
  // Data Layer
  sl.registerLazySingleton<QuestionRemoteDataSource>(() =>
      QuestionRemoteDataSourceImpl(
          dioClient: sl()));
  sl.registerLazySingleton<QuestionRepository>(() => QuestionRepositoryImpl(
        networkInfo: sl(),
        questionRemoteDataSource: sl(),
      ));

  // Domain Layer
  sl.registerLazySingleton(() => GetQuestions(sl()));
  sl.registerFactory(() => AnswerToQuestion(sl()));
  sl.registerLazySingleton(() => GetMistakes(sl()));
  sl.registerLazySingleton(() => AnswerToMistake(sl()));

  // Presentation Layer
  sl.registerFactory(() => QuestionBloc(getQuestions: sl()));
  sl.registerFactory(() => HomeScreenPagesCubit());
  sl.registerFactory(
      () => VariantBloc(answerToQuestion: sl(), answerToMistake: sl()));
  sl.registerFactory(() => MistakeBloc(getMistakes: sl()));
}
