import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/question.dart';
import '../widgets/variants_bar.dart';

class TestScrollingPage extends StatefulWidget {
  const TestScrollingPage({
    super.key,
    required this.themeData,
    required this.alphabetLetters,
    required this.questions,
  });

  final ThemeData themeData;
  final List<String> alphabetLetters;
  final List<Question> questions;

  @override
  State<TestScrollingPage> createState() => _TestScrollingPageState();
}

class _TestScrollingPageState extends State<TestScrollingPage>
    with AutomaticKeepAliveClientMixin {
  final questionPageController = PageController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.questions.length,
      itemBuilder: (BuildContext context, int index) {
        final question = widget.questions[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40.h,
              ),
              Text(
                "Тема:",
                style: widget.themeData.textTheme.labelSmall,
              ),
              Text(
                question.topicIds[0].topicName,
                style: widget.themeData.textTheme.headlineSmall,
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
                          style: widget.themeData.textTheme.bodyMedium,
                          question.question,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    VariantsBar(question: question, widget: widget)
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Не знаю ответ',
                style: widget.themeData.textTheme.labelSmall,
              )
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
