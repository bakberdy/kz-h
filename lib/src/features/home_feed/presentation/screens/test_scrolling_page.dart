import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kz_h/injection_container.dart';
import 'package:kz_h/src/core/themes/colors.dart';
import 'package:kz_h/src/features/auth/presentation/blocs/auth_bloc/bloc/auth_bloc.dart';
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
  }

  void _loadNextPage() {
    _fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<QuestionBloc, QuestionState>(
      listener: (context, state) {
        if (state is NextPageLoaded) {
          //  _pageController.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.easeInOutExpo);
          BotToast.closeAllLoading();
          // }else if(state is NextPageLoading){
          //   BotToast.showLoading(backgroundColor: AppColors.bluePurpleColor);
        } else if (state is QuestionError) {
          BotToast.closeAllLoading();
          BotToast.showText(text: state.message, contentColor: Colors.red);
        }
      },
      builder: (context, state) {
        if (state is QuestionLoading) {
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
      child: LoadingAnimationWidget.fourRotatingDots(
          size: 60.sp, color: AppColors.bluePurpleColor),
    );
  }

  Widget _buildScrollableView(QuestionState state) {
    final questions = state is QuestionLoaded
        ? state.questions
        : (state as NextPageLoading).questions;

    return PageView.builder(
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
        print(question.questionId);
        return BlocProvider.value(
          value: _blocCache['${question.questionId}+$index']!,
          key: PageStorageKey('Question_${question.questionId}$index}'),

          child: QuestionWidget(question: question),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
