
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthInputField extends StatelessWidget {
  const AuthInputField({
    super.key,
    required this.hintText,
    this.validator, this.obscuredText = false, this.controller,
  });

  final String hintText;
  final FormFieldValidator? validator;
  final bool obscuredText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return TextFormField(
      obscureText: obscuredText,
        validator: validator,
        style: themeData.textTheme.headlineSmall?.copyWith(color: Colors.black),
        maxLines: 1,
        cursorColor: const Color(0xff7D7D7D),
        decoration: InputDecoration(
            focusColor: Colors.black,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(32.r)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(32.r)),
            hintStyle: themeData.textTheme.headlineSmall
                ?.copyWith(color: const Color(0xff7D7D7D)),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(32.r))));
  }
}
