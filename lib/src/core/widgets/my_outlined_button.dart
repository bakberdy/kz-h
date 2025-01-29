import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kz_h/src/core/themes/colors.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    super.key, required this.text, required this.onTap,
  });

final String text;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return OutlinedButton(
        onPressed: onTap,
        style: ButtonStyle(
            side: const WidgetStatePropertyAll(
                BorderSide(color: Colors.red)),
            overlayColor: WidgetStatePropertyAll(
                AppColors.secondaryTextColor.withAlpha(25)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r)))),
        child: Text(
          text,
          style:
              themeData.textTheme.bodySmall?.copyWith(color: Colors.red, letterSpacing: -0.5),
        ));
  }
}
