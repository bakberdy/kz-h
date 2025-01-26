import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kz_h/src/features/home_feed/domain/entities/question.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/variant/variant_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/widgets/variant_widget.dart';
import 'package:kz_h/src/features/home_feed/presentation/widgets/variants_bar.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.question, required this.isMistake,
  });

  final Question question;
  final bool isMistake;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.w),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40.h,
          ),
          Text(
            "Тема:",
            style: themeData.textTheme.labelSmall,
          ),
          Text(
            question.topicName ?? 'Қарастырылмаған',
            style: themeData.textTheme.headlineSmall,
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            padding: EdgeInsets.only(
                top: 24.h, right: 20.w, left: 20.w, bottom: 5.h),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: const Color(0xff4A4A4A),
                ),
                borderRadius: BorderRadius.circular(4.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  children: [
                    Text(
                      style: themeData.textTheme.bodyMedium,
                      question.question,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                VariantsBar(question: question, isMistake: isMistake,)
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          BlocBuilder<VariantBloc, VariantState>(
            builder: (BuildContext context, VariantState state) {
              if (state is VariantLoaded && state.correctVariant != null) {
                return Column(
                  children: [
                    Text(
                      'Дұрыс жауап:',
                      style: themeData.textTheme.labelSmall,
                    ),
                    SizedBox(height: 10.h,),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border:
                              Border.all(color: Colors.transparent, width: 1),
                          color: Colors.green),
                      child: Text(
                        state.correctVariant?.text ?? 'null',
                        style: themeData.textTheme.bodySmall,
                      ),
                    ),
                  ],
                );
              } else {
                return Text(
                  'Не знаю ответ',
                  style: themeData.textTheme.labelSmall,
                );
              }
            },
          ),
          // SizedBox(
          //   height: 10.h,
          // ),
        ],
      ),
    );
  }
}
