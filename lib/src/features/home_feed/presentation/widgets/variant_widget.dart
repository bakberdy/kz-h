import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/variant.dart';
import '../blocs/variant/variant_bloc.dart';

class VariantWidget extends StatelessWidget {
  const VariantWidget({
    super.key,
    required this.variant,
    required this.themeData,
    required this.letterIndex,
    required this.onTap,
    required this.index,
  });

  final Variant variant;
  final ThemeData themeData;
  final String letterIndex;
  final VoidCallback onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BlocBuilder<VariantBloc, VariantState>(builder: (context, state) {
        if (state is VariantInitial) {
          return InkWell(
            onTap: !(state.correct != null) ? onTap : null,
            borderRadius: BorderRadius.circular(4.r),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                    color: state.correct == null || index != state.index
                        ? const Color(0xff4A4A4A)
                        : Colors.transparent,
                    width: 1),
                color: state.correct == null || index != state.index
                    ? Colors.transparent
                    : state.correct == true
                        ? Colors.green
                        : Colors.red,
              ),
              child: Text(
                "$letterIndex) ${variant.text}",
                style: themeData.textTheme.bodySmall,
              ),
            ),
          );
        }
        return const SizedBox();
      }),
      SizedBox(
        height: 15.h,
      )
    ]);
  }
}
