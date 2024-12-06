import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.themeData,
    required this.currentIndex,
    required this.onPageSelected,
  });

  final ThemeData themeData;
  final int currentIndex;
  final Function(int) onPageSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              onPageSelected(0);
            },
            child: Container(
              alignment: Alignment.center,
              height: 70.h,
              child: Text(
                "For you",
                style: currentIndex == 0
                    ? themeData.textTheme.bodyMedium
                    : themeData.textTheme.bodyMedium
                        ?.copyWith(color: AppColors.secondaryTextColor),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              onPageSelected(1);
            },
            child: Container(
              alignment: Alignment.center,
              height: 70.h,
              child: Text(
                "Mistakes",
                style: currentIndex == 1
                    ? themeData.textTheme.bodyMedium
                    : themeData.textTheme.bodyMedium
                        ?.copyWith(color: AppColors.secondaryTextColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
