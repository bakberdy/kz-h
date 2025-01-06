import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kz_h/src/core/themes/colors.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/question/question_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/widgets/question_widget.dart';

class TestScrollingPage extends StatefulWidget {
  const TestScrollingPage({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  State<TestScrollingPage> createState() => _TestScrollingPageState();
}

class _TestScrollingPageState extends State<TestScrollingPage> with AutomaticKeepAliveClientMixin {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  double _overscrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchQuestions();
  }

  void _fetchQuestions() {
    context.read<QuestionBloc>().add(GetQuestionRequested(pageIndex: _currentPageIndex));
  }

  void _loadNextPage() {
    setState(() {
      _currentPageIndex++;
    });
    _fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<QuestionBloc, QuestionState>(
      listener: (context, state) {
        if (state is QuestionLoaded) {
          setState(() {
            _overscrollOffset = 0.0;
          });
        }
      },
      builder: (context, state) {
        if (state is QuestionLoading && _currentPageIndex == 0) {
          return _buildLoadingIndicator();
        }

        if (state is QuestionLoaded || state is NextPageLoading) {
          return _buildScrollableView(state);
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 3,
        color: AppColors.bluePurpleColor,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  Widget _buildScrollableView(QuestionState state) {
    final questions = state is QuestionLoaded
        ? state.questions
        : (state as NextPageLoading).questions;

    return NotificationListener<OverscrollNotification>(
      onNotification: (OverscrollNotification overscroll) {
        if (overscroll.overscroll > 0 &&
            state is QuestionLoaded &&
            _pageController.page == questions.length - 1) {
          setState(() {
            _overscrollOffset = overscroll.overscroll.clamp(0.0, 50.0); // Ограничиваем смещение
          });

          if (_overscrollOffset == 50.0) {
            _loadNextPage();
          }
        }
        return true;
      },
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: questions.length,
            itemBuilder: (BuildContext context, int index) {
              final question = questions[index];
              return QuestionWidget(question: question);
            },
          ),
          Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            child: _buildPullIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _buildPullIndicator() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: _overscrollOffset > 0.0 ? 1.0 : 0.0,
      child: Transform.translate(
        offset: Offset(0, _overscrollOffset),
        child: SizedBox(
          height: 40.h,
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.bluePurpleColor,
              backgroundColor: Colors.transparent,
              strokeWidth: 3.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
