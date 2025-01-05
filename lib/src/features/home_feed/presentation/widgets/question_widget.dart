
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kz_h/src/features/home_feed/domain/entities/question.dart';
import 'package:kz_h/src/features/home_feed/presentation/widgets/variants_bar.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.w),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 60.h,
          ),
          Text(
            "Тема:",
            style: themeData.textTheme.labelSmall,
          ),
          Text(
            question.topicIds[0].topicName,
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
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                VariantsBar(question: question)
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            'Не знаю ответ',
            style: themeData.textTheme.labelSmall,
          )
        ],
      ),
    );
  }
}
