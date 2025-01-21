import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFilledButton extends StatelessWidget {
  const MyFilledButton({
    super.key, required this.text, required this.onPressed, required this.bgColor,
  });
  final String text;
  final VoidCallback onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
               WidgetStatePropertyAll(bgColor),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.r))),
        ),
        
        child: Text(text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500)));
  }
}
