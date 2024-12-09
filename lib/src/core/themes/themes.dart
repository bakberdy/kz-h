import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final appTheme = ThemeData(
                scaffoldBackgroundColor: AppColors.darkBgColor,
                textTheme: TextTheme(
                  headlineMedium: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 24.sp,
                          color: AppColors.primaryTextColor,
                          fontWeight: FontWeight.w400)),
                  headlineSmall: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.primaryTextColor,
                          fontWeight: FontWeight.w400)),
                  labelSmall: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.secondaryTextColor,
                          fontWeight: FontWeight.w400)),
                  bodyMedium: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.primaryTextColor,
                          fontWeight: FontWeight.w400)),
                  bodySmall: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.primaryTextColor,
                          fontWeight: FontWeight.w400)),
                ));