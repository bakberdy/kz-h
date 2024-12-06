import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/widgets/variant_widget.dart';

import '../../../../../injection_container.dart' as di;
import '../../domain/entities/question.dart';
import '../blocs/variant/variant_bloc.dart';
import '../screens/home_feed.dart';

class VariantsBar extends StatelessWidget {
  const VariantsBar({
    super.key,
    required this.question,
    required this.widget,
  });

  final Question question;
  final TestScrollingPage widget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<VariantBloc>(),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: question.variants.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final variant = question.variants[index];
          return VariantWidget(
            themeData: widget.themeData,
            variant: variant,
            letterIndex: widget.alphabetLetters[index],
            onTap: () {
              context.read<VariantBloc>().add(
                  VariantTappedRequested(
                      correct: variant.correct,
                      index: index));
            }, index: index,
          );
        },
      ),
    );
  }
}
