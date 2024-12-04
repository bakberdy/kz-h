import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kz_h/src/core/routes/app_router.dart';
import 'package:kz_h/src/core/themes/colors.dart';
import 'package:kz_h/src/core/themes/themes.dart';
import 'package:kz_h/src/features/home_feed/presentation/screens/home_feed.dart';

void main() {
  final appRouter = AppRouter();
  runApp(MyApp(appRouter: appRouter));
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
            routerConfig: appRouter.config(),
            theme: appTheme,
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
