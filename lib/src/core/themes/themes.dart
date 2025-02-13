import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kz_h/src/core/themes/colors.dart';

final appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.darkBgColor,
  fontFamily: GoogleFonts.inter().fontFamily,
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      fontSize: 24,
      color: AppColors.primaryTextColor,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      color: AppColors.primaryTextColor,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      color: AppColors.secondaryTextColor,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: AppColors.primaryTextColor,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      color: AppColors.primaryTextColor,
      fontWeight: FontWeight.w400,
    ),
  ),
);
