import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kz_h/src/core/themes/colors.dart';
import 'package:kz_h/src/features/home_feed/presentation/screens/mistakes.dart';

@RoutePage()
class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  final questions = [
    {
      'topic': "Казахское ханство",
      'question': "В каком году зародилась казахское ханство?",
      'variants': [
        "В 1465",
        "В 1475",
        "В 1765",
        "В 1415",
        "В 1455",
        "В 1445",
      ]
    },
    {
      'topic': "Казахское ханство",
      'question': "В каком году зародилась казахское ханство?",
      'variants': [
        "В 1465",
        "В 1475",
        "В 1765",
        "В 1415",
        "В 1455",
        "В 1445",
      ]
    },
    {
      'topic': "Казахское ханство",
      'question': "В каком году зародилась казахское ханство?",
      'variants': [
        "В 1465",
        "В 1475",
        "В 1765",
        "В 1415",
        "В 1455",
        "В 1445",
      ]
    }
  ];
  final homePageAndMistakePageController = PageController();
  int currentIndexOfPage = 0;

  void _onPageStateChanged(int index) {
    setState(() {
      currentIndexOfPage = index;
    });
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
            HomeFeedBody(
              questions: questions,
                themeData: themeData, alphabetLetters: alphabetLetters),
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
  final List questions;

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
                question['topic'],
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
                            question['question'],)
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: question['variants'].length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            Container(
                              alignment: Alignment.center,
                              height: 38.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(
                                      color: Color(0xff4A4A4A), width: 1)),
                              child: Text(
                                "${widget.alphabetLetters[index]}) ${question['variants'][index]}",
                                style: widget.themeData.textTheme.bodySmall,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
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
