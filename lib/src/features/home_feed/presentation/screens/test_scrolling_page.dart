import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kz_h/injection_container.dart';
import 'package:kz_h/src/core/themes/colors.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/question/question_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/variant/variant_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/widgets/question_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class TestScrollingPage extends StatefulWidget {
  const TestScrollingPage({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  State<TestScrollingPage> createState() => _TestScrollingPageState();
}

class _TestScrollingPageState extends State<TestScrollingPage>
    with AutomaticKeepAliveClientMixin {
  final PageController _pageController = PageController();
  final Map<String, VariantBloc> _blocCache = {};

  @override
  void initState() {
    super.initState();
    _fetchQuestions();
  }

  void _fetchQuestions() {
    context.read<QuestionBloc>().add(GetQuestionRequested());
    _blocCache.clear();
  }

  void _loadNextPage() {
    context.read<QuestionBloc>().add(GetNextQuestionRequested());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<QuestionBloc, QuestionState>(
      listener: (context, state) {
        if (state is NextPageLoaded) {
          BotToast.closeAllLoading();
        } else if (state is QuestionError) {
          BotToast.closeAllLoading();
          BotToast.showText(
              contentColor: Colors.red,
              text: state.message,
              textStyle: TextStyle(fontSize: 16.sp));
        }
      },
      builder: (context, state) {
        if (state is QuestionLoading) {
          return _buildLoadingIndicator();
        } else if (state is QuestionLoaded || state is NextPageLoading) {
          return _buildScrollableView(state);
        } else if (state is QuestionError) {
          return InkWell(
            highlightColor: AppColors.darkBgColor,
            splashColor: AppColors.bottomNavigationBarColor,
            onTap: () async {
              _fetchQuestions();
            },
            child: Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          );
        } else {
          return RefreshIndicator(
              backgroundColor: Colors.transparent,
              color: AppColors.bluePurpleColor,
              onRefresh: () async {
                _fetchQuestions();
              },
              child: const SizedBox());
        }
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: LoadingAnimationWidget.fourRotatingDots(
          size: 60.sp, color: AppColors.bluePurpleColor),
    );
  }

  Widget _buildScrollableView(QuestionState state) {
    final questions = state is QuestionLoaded
        ? state.questions
        : (state as NextPageLoading).questions;

    return RefreshIndicator(
      backgroundColor: Colors.transparent,
      color: AppColors.bluePurpleColor,
      onRefresh: () async {
        _fetchQuestions();
      },
      child: Column(
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: questions.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == questions.length - 1) {
                _loadNextPage();
              }
              final question = questions[index];
          
              if (!_blocCache.containsKey('${question.questionId}+$index')) {
                _blocCache['${question.questionId}+$index'] = sl<VariantBloc>();
              }
              return SingleChildScrollView(
                child: BlocProvider.value(
                  value: _blocCache['${question.questionId}+$index']!,
                  key: PageStorageKey('${question.questionId}+$index'),
                  child: QuestionWidget(
                    question: question,
                    isMistake: false,
                    onVariantPressed: () {
                      _pageController.animateToPage(1 + index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
