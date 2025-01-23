import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kz_h/src/core/themes/colors.dart';

class StatisticsContainer extends StatelessWidget {
  const StatisticsContainer({
    super.key,
    required this.themeData,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  final TextTheme themeData;
  final String icon;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(width: 1, color: AppColors.secondaryTextColor)),
        child: Row(
          children: [
            SizedBox(
              width: 5.w,
            ),
            SvgPicture.asset(icon),
            SizedBox(
              width: 10.w,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        height: 1,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: color),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(subtitle,
                      style: themeData.labelSmall?.copyWith(height: 1)),
                ]),
          ],
        ),
      ),
    );
  }
}
