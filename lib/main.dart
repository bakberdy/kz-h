import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kz_h/generated/l10n.dart';
import 'package:kz_h/injection_container.dart' as di;
import 'package:kz_h/src/core/routes/app_router.dart';
import 'package:kz_h/src/core/themes/themes.dart';
import 'package:kz_h/src/features/auth/presentation/blocs/auth_bloc/bloc/auth_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/home_screen_pages/home_screen_pages_cubit.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/mistakes/mistake_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/question/question_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.initDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => di.sl<QuestionBloc>()),
    BlocProvider(create: (_) => di.sl<MistakeBloc>()),
    BlocProvider(create: (_) => di.sl<HomeScreenPagesCubit>()),
    BlocProvider(create: (_) => di.sl<AuthBloc>()),
  ], child: MyApp(appRouter: di.sl<AppRouter>())));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(402, 874),
        builder: (context, child) {
          return MaterialApp.router(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: const Locale('kk'),
            supportedLocales: const [Locale('ru'), Locale('kk')],
            builder: (context, child) => BotToastInit()(context, child),
            routerConfig: appRouter.config(),
            darkTheme: appTheme,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            theme: appTheme,
          );
        });
  }
}
