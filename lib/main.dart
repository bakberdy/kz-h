import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kz_h/src/features/home_feed/presentation/screens/home_feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(402, 874),
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xff1A1A1A),
              textTheme: TextTheme(
                headlineSmall: GoogleFonts.inter(textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: const Color(0xffDFDEDE),
                  fontWeight: FontWeight.w400
                )),
                labelSmall: GoogleFonts.inter(textStyle: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff91898C),
                  fontWeight: FontWeight.w400
                )),
                bodyMedium: GoogleFonts.inter(textStyle: TextStyle(
                  fontSize: 16.sp,
                  color: const Color(0xffDFDEDE),
                  fontWeight: FontWeight.w400
                )),
                bodySmall: GoogleFonts.inter(textStyle: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xffDFDEDE),
                  fontWeight: FontWeight.w400
                )),
              )
            ),
            debugShowCheckedModeBanner: false,
              home: const HomeFeed());
        });
  }
}
