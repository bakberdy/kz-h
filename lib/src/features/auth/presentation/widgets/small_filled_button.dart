import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallFilledButton extends StatelessWidget {
  const SmallFilledButton({
    super.key,
    required this.secondaryColor,
    required this.text,
    required this.onTap,
  });

  final Color secondaryColor;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      width: 120.w,
      child: FilledButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(0)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r))),
            backgroundColor: WidgetStatePropertyAll(secondaryColor),
          ),
          onPressed: onTap,
          child: Text(text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp))),
    );
  }
}
