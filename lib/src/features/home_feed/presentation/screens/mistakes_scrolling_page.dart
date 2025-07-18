import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kz_h/injection_container.dart';
import 'package:kz_h/src/core/themes/colors.dart';
import 'package:kz_h/src/core/widgets/welcome_widget.dart';
import 'package:kz_h/src/features/auth/presentation/blocs/auth_bloc/bloc/auth_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/mistakes/mistake_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/question/question_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/blocs/variant/variant_bloc.dart';
import 'package:kz_h/src/features/home_feed/presentation/widgets/question_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MistakesScrollingPage extends StatefulWidget {
  const MistakesScrollingPage({
    super.key,
    required this.themeData,
  });
  final ThemeData themeData;
  @override
  State<MistakesScrollingPage> createState() => _MistakesScrollingPageState();
}

class _MistakesScrollingPageState extends State<MistakesScrollingPage>
    with AutomaticKeepAliveClientMixin {
  final PageController _pageController = PageController();
  final Map<String, VariantBloc> _blocCache = {};

  @override
  void initState() {
    super.initState();
    _fetchQuestions();
  }

  void _fetchQuestions() {
    context.read<MistakeBloc>().add(GetMistakeRequested());
    _blocCache.clear();
  }

  // void _loadNextPage() {
  //   context.read<MistakeBloc>().add(GetNextMistakeRequested());
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is UnAuthenticated || state is AuthInitial) {
          return Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              SvgPicture.asset('lib/assets/images/kzh_logo.svg'),
              const Center(
                  child: Padding(
                padding: EdgeInsets.all(22.0),
                child: WelcomWidget(),
              )),
            ],
          );
        }
        return BlocConsumer<MistakeBloc, MistakeState>(
          listener: (context, state) {
            if (state is NextPageLoaded) {
              BotToast.closeAllLoading();
            } else if (state is MistakeError) {
              BotToast.closeAllLoading();
              BotToast.showText(text: state.message, contentColor: Colors.red);
            }
          },
          builder: (context, state) {
            if (state is MistakeLoading) {
              return _buildLoadingIndicator();
            } else if (state is MistakeError) {
              return InkWell(
                  onTap: () {
                    _fetchQuestions();
                  },
                  highlightColor: AppColors.darkBgColor,
                  splashColor: AppColors.bottomNavigationBarColor,
                  child: Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ));
            }

            if (state is MistakeLoaded || state is MistakeNextPageLoading) {
              return _buildScrollableView(state);
            }
            return InkWell(
              onTap: () {
                context.read<MistakeBloc>().add(GetMistakeRequested());
              },
            );
          },
        );
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: LoadingAnimationWidget.fourRotatingDots(
          size: 60.sp, color: AppColors.bluePurpleColor),
    );
  }

  Widget _buildScrollableView(MistakeState state) {
    final questions = state is MistakeLoaded
        ? state.questions
        : (state as MistakeNextPageLoading).questions;

    return RefreshIndicator(
      color: AppColors.bluePurpleColor,
      backgroundColor: Colors.transparent,
      onRefresh: () async {
        _fetchQuestions();
      },
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: questions.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index >= questions.length) {
            return InkWell(
                highlightColor: Colors.transparent,
                splashColor: AppColors.bottomNavigationBarColor,
                onTap: index == 0
                    ? () {
                        context.read<MistakeBloc>().add(GetMistakeRequested());
                      }
                    : null,
                child: const Center(child: Text('Қате сұрақтар бітті')));
          } else {
            final question = questions[index];

            if (!_blocCache
                .containsKey('${question.mistakeQuestionId}+$index')) {
              _blocCache['${question.mistakeQuestionId}+$index'] =
                  sl<VariantBloc>();
            }
            return SingleChildScrollView(
              child: BlocProvider.value(
                value: _blocCache['${question.mistakeQuestionId}+$index']!,
                key: PageStorageKey(
                    'Question_${question.mistakeQuestionId}$index}'),
                child: QuestionWidget(
                  question: question,
                  isMistake: true,
                  onVariantPressed: () {
                    _pageController.animateToPage(index + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
