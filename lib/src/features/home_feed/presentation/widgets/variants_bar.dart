import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kz_h/src/features/home_feed/domain/entities/variant.dart';
import 'package:kz_h/src/features/home_feed/presentation/widgets/variant_widget.dart';

import '../../domain/entities/question.dart';
import '../blocs/variant/variant_bloc.dart';

class VariantsBar extends StatelessWidget {
  VariantsBar({
    super.key,
    required this.question,
    required this.isMistake,
  });
  final bool isMistake;

  final Question question;
  final alphabetLetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I"];

  void onVariantTapped(
      {required Variant variant,
      required VariantState state,
      required BuildContext context}) {
    print('${question.mistakeQuestionId}shhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
    if (state is! VariantLoaded) {
      context.read<VariantBloc>().add(VariantTappedRequested(
          questionId: isMistake
              ? question.mistakeQuestionId ?? ''
              : question.questionId,
          selectedOption: variant.text));
    } else {
      BotToast.showText(
          align: const Alignment(0, 0.7),
          text: 'You can answer only 1 time',
          contentColor: const Color(0xff272727),
          textStyle: TextStyle(fontSize: 15.sp));
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocConsumer<VariantBloc, VariantState>(
      builder: (context, state) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: question.variants.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final defVariants =
                question.variants.map((e) => Variant(text: e)).toList();
            final variant = state is VariantLoaded &&
                    state.selectedVariant.text == defVariants[index].text
                ? state.selectedVariant
                : defVariants[index];

            return VariantWidget(
              isLoading: state is VariantLoading &&
                  variant.text == state.selectedOption,
              themeData: themeData,
              variant: variant,
              letterIndex: alphabetLetters[index],
              onTap: state is VariantLoading
                  ? null
                  : () {
                      onVariantTapped(
                          variant: variant, state: state, context: context);
                    },
              questionState: variant.questionState,
            );
          },
        );
      },
      listener: (BuildContext context, state) {
        if (state is VariantError) {
          BotToast.showText(
              contentColor: Colors.red,
              text: state.message,
              textStyle: TextStyle(fontSize: 16.sp));
        }
      },
    );
  }
}
