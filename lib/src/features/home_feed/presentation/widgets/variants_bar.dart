import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/widgets/variant_widget.dart';

import '../../../../../injection_container.dart' as di;
import '../../domain/entities/question.dart';
import '../blocs/variant/variant_bloc.dart';

class VariantsBar extends StatelessWidget {
  VariantsBar({
    super.key,
    required this.question,
  });

  final Question question;
  final alphabetLetters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
  ];

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: question.variants.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final variant = question.variants[index];
        return VariantWidget(
          themeData: themeData,
          variant: variant,
          letterIndex: alphabetLetters[index],
          onTap: () {
            context.read<VariantBloc>().add(VariantTappedRequested(
                correct: variant.correct,
                index: index,
                questionId: question.questionId,
                selectedOption: variant.text));
          },
          index: index,
        );
      },
    );
  }
}
