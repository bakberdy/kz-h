import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/home_screen_pages/home_screen_pages_cubit.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/question/question_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/screens/mistakes_page.dart';
import 'package:kz_h/src/features/home_feed/presentation/screens/test_scrolling_page.dart';

import '../widgets/home_app_bar_widget.dart';

@RoutePage()
class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  final PageController _homePageAndMistakePageController = PageController();


  @override
  Widget build(BuildContext context) {

    final themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: BlocBuilder<HomeScreenPagesCubit, int>(
            builder: (context, currentIndex) {
              return HomeAppBar(
                themeData: themeData,
                currentIndex: currentIndex,
                onPageSelected: _onPageSelected,
              );
            },
          ),
        ),
        body: PageView(
          controller: _homePageAndMistakePageController,
          onPageChanged: _onPageChanged,
          children: [
           TestScrollingPage(
                    themeData: themeData,
                  ),
            const MistakesPage(),
          ],
        ),
      ),
    );
  }

  void _onPageChanged(int index) {
    if (index != context.read<HomeScreenPagesCubit>().state) {
      context.read<HomeScreenPagesCubit>().goToPage(index);
    }
  }

  void _onPageSelected(int index) {
    if (index != context.read<HomeScreenPagesCubit>().state) {
      context.read<HomeScreenPagesCubit>().goToPage(index);
      _homePageAndMistakePageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInSine,
      );
    }
  }
}

