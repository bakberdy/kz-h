import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFilledButton extends StatelessWidget {
  const MyFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.bgColor,
    this.textColor = Colors.white,
    this.borderColor,
  });
  final String text;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(bgColor),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              side: borderColor != null
                  ? BorderSide(color: borderColor!, width: 1)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(32.r))),
        ),
        child: Text(text,
            style: TextStyle(
                color: textColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500)));
  }
}
