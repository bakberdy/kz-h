
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kz_h/src/core/themes/colors.dart';

class EditInputField extends StatelessWidget {
  const EditInputField({
    super.key,
    required this.secondaryColor, required this.label, this.hintText, this.controller, this.validator,
  });

  final Color secondaryColor;
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(5),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: themeData.textTheme.labelSmall?.copyWith(letterSpacing: -0.5)),
        SizedBox(
          height: 5.h,
        ),
        SizedBox(
          height: 45.h,
          width: double.infinity,
          child: TextFormField(

            validator: validator,
            style: themeData.textTheme.bodyMedium,
            cursorColor: AppColors.darkBgColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              filled: true,
              fillColor: secondaryColor,
              border: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              disabledBorder: outlineInputBorder,
            ),
          ),
        ),
        const SizedBox(height: 3,),
      ],
    );
  }
}
