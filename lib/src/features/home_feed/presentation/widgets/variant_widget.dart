import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kz_h/src/core/themes/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../domain/entities/variant.dart';
import '../blocs/variant/variant_bloc.dart';

class VariantWidget extends StatelessWidget {
  const VariantWidget({
    super.key,
    required this.variant,
    required this.themeData,
    required this.letterIndex,
    required this.onTap,
    required this.questionState,
    required this.isLoading,
  });

  final bool isLoading;
  final Variant variant;
  final ThemeData themeData;
  final String letterIndex;
  final VoidCallback? onTap;
  final QuestionStateEnum questionState;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(4.r),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(
                color: questionState == QuestionStateEnum.notSelected
                    ? const Color(0xff4A4A4A)
                    : Colors.transparent,
                width: 1),
            color: questionState == QuestionStateEnum.notSelected
                ? Colors.transparent
                : questionState == QuestionStateEnum.correct
                    ? Colors.green
                    : Colors.red,
          ),
          child: isLoading
              ? Center(
                child: LoadingAnimationWidget.horizontalRotatingDots(
                    color: AppColors.bluePurpleColor, size: 30.sp),
              )
              : Text(
                  "$letterIndex) ${variant.text}",
                  style: themeData.textTheme.bodySmall,
                ),
        ),
      ),
      SizedBox(
        height: 15.h,
      )
    ]);
  }
}

enum QuestionStateEnum { correct, inccorrect, notSelected }
