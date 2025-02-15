import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kz_h/src/features/auth/presentation/blocs/auth_bloc/bloc/auth_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/mistakes/mistake_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/question/question_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/screens/mistakes_scrolling_page.dart';
import 'package:kz_h/src/features/home_feed/presentation/screens/test_scrolling_page.dart';

import '../../../../core/themes/colors.dart';

@RoutePage()
class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  final PageController _homePageAndMistakePageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    context.read<AuthBloc>().add(GetUserInfoRequested());
    super.initState();
  }

  @override
  void dispose() {
    _homePageAndMistakePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  highlightColor: Colors.transparent,
                  overlayColor: WidgetStateColor.transparent,
                  splashColor: Colors.transparent,
                  onDoubleTap: (){
                    context.read<QuestionBloc>().add(GetQuestionRequested());
                  },
                  onTap: () {
                    _onPageSelected(0);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 70.h,
                    child: Text(
                      "For you",
                      style: _currentPage == 0
                          ? themeData.textTheme.bodyMedium
                          : themeData.textTheme.bodyMedium
                          ?.copyWith(color: AppColors.secondaryTextColor),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  highlightColor: Colors.transparent,
                  overlayColor: WidgetStateColor.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    _onPageSelected(1);
                    context.read<MistakeBloc>().add(GetMistakeRequested());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 70.h,
                    child: Text(
                      "Mistakes",
                      style: _currentPage == 1
                          ? themeData.textTheme.bodyMedium
                          : themeData.textTheme.bodyMedium
                          ?.copyWith(color: AppColors.secondaryTextColor),
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
        body: PageView(
          controller: _homePageAndMistakePageController,
          onPageChanged: _onPageChanged,
          children: [
            TestScrollingPage(themeData: themeData),
            MistakesScrollingPage(themeData: themeData),
          ],
        ),
      ),
    );
  }

  void _onPageChanged(int index) {
    _currentPage=index;
    setState(() {});
  }

  void _onPageSelected(int index) {
    _homePageAndMistakePageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInSine,
    );
  }}
