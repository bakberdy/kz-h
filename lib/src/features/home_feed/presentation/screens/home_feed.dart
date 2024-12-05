import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kz_h/src/core/themes/colors.dart';
import 'package:kz_h/src/features/home_feed/domain/entities/topic.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/question/question_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/screens/mistakes.dart';

import '../../domain/entities/question.dart';

@RoutePage()
class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  final homePageAndMistakePageController = PageController();
  int currentIndexOfPage = 0;

  void _onPageStateChanged(int index) {
    setState(() {
      currentIndexOfPage = index;
    });
  }

  @override
  void initState() {
    context.read<QuestionBloc>().add(GetQuestionRequested());
    // TODO: implement initState
    super.initState();
  }

  void _onAppBarTapped(int index) {
    homePageAndMistakePageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    const alphabetLetters = [
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "I",
      "J",
      "K",
      "L",
      "M",
      "N",
      "O",
      "P",
      "Q",
      "R",
      "S",
      "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z"
    ];
    final themeData = Theme.of(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    _onAppBarTapped(0);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 70.h,
                    child: Text(
                      "For you",
                      style: currentIndexOfPage==0?themeData.textTheme.bodyMedium:themeData.textTheme.bodyMedium
                          ?.copyWith(color: AppColors.secondaryTextColor),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: (){
                    _onAppBarTapped(1);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 70.h,
                    child: Text(
                      "Mistakes",
                      style: currentIndexOfPage==1?themeData.textTheme.bodyMedium:themeData.textTheme.bodyMedium
                          ?.copyWith(color: AppColors.secondaryTextColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: PageView(
          onPageChanged: _onPageStateChanged,
          controller: homePageAndMistakePageController,
          scrollDirection: Axis.horizontal,
          children: [
            BlocBuilder<QuestionBloc, QuestionState>(
              builder: (context, state) {
                if(state is QuestionLoaded){
                  return HomeFeedBody(
                  questions: state.questions,
                    themeData: themeData, alphabetLetters: alphabetLetters);
                }
                return const SizedBox();
              }
            ),
            const MistakesPage()
          ],
        ));
  }
}

class HomeFeedBody extends StatefulWidget {
  const HomeFeedBody({
    super.key,
    required this.themeData,
    required this.alphabetLetters, required this.questions,
  });

  final ThemeData themeData;
  final List<String> alphabetLetters;
  final List<Question> questions;

  @override
  State<HomeFeedBody> createState() => _HomeFeedBodyState();
}

class _HomeFeedBodyState extends State<HomeFeedBody>  with AutomaticKeepAliveClientMixin{
  final questionPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView.builder(
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
                      color: Color(0xff4A4A4A),
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
                            question.question,)
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: question.variants.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.all(5),
                              height: 45.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(
                                      color: Color(0xff4A4A4A), width: 1)),
                              child: Text(
                                "${widget.alphabetLetters[index]}) ${question.variants[index].text}",
                                style: widget.themeData.textTheme.bodySmall,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            )
                          ]);
                        }),
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
