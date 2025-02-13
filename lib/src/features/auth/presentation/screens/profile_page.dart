import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kz_h/generated/l10n.dart';
import 'package:kz_h/src/core/routes/app_router.gr.dart';
import 'package:kz_h/src/core/themes/colors.dart';
import 'package:kz_h/src/core/utils/utils.dart';
import 'package:kz_h/src/core/widgets/welcome_widget.dart';
import 'package:kz_h/src/features/auth/domain/entiities/user.dart';
import 'package:kz_h/src/features/auth/presentation/blocs/auth_bloc/bloc/auth_bloc.dart';
import 'package:kz_h/src/features/auth/presentation/widgets/statistics_container.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<AuthBloc>().add(GetUserInfoRequested());
          },
          color: AppColors.bluePurpleColor,
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            fit: BoxFit.cover,
                            'lib/assets/images/aaa.jpg',
                            color: Colors.black.withOpacity(0.5),
                            colorBlendMode: BlendMode.darken,
                          )),
                      SizedBox(
                          height: 200.h,
                          child: Center(
                              child: Image.asset(
                                  fit: BoxFit.cover,
                                  'lib/assets/images/kzh_logo.png'))),
                      Positioned(
                          top: 20.h,
                          right: 20.w,
                          child: GestureDetector(
                              onTap: () {
                                context.router
                                    .pushNamed('/settings');
                              },
                              child:
                                  Image.asset('lib/assets/icons/settings.png')))
                    ],
                  ),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (BuildContext context, state) {
                      if (state is AuthError) {
                        BotToast.showText(
                            contentColor: Colors.red,
                            text: state.message,
                            textStyle: TextStyle(fontSize: 16.sp));
                      }
                    },
                    builder: (context, state) {
                      User? user;
                      if (state is Authenticated) {
                        user = state.user;
                      } else if (state is UnAuthenticated ||
                          state is AuthInitial) {
                        return const Padding(
                          padding: EdgeInsets.all(22.0),
                          child: WelcomWidget(),
                        );
                      }
                      return Skeletonizer(
                        enabled: state is! Authenticated,
                        effect: const ShimmerEffect(
                          baseColor: Color(0xff272727),
                          highlightColor: Color(0xff272727),
                          duration: Duration(seconds: 1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 18.h,
                              ),
                              Text(
                                user?.fullName ?? 'N/A',
                                style: themeData.headlineMedium,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                S.of(context).usernameJoinedMonthYear(
                                    user?.username ?? 'N/A',
                                    monthFromIntToString(
                                        user?.joinedDate?.month ?? 1, context),
                                    user?.joinedDate?.year ?? 1900),
                                style: themeData.bodySmall?.copyWith(
                                    color: AppColors.secondaryTextColor),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                S.of(context).profileOverview,
                                style: themeData.bodyMedium,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  StatisticsContainer(
                                    themeData: themeData,
                                    icon: "lib/assets/icons/fire.svg",
                                    title: '${user?.fireDays}',
                                    subtitle: S.of(context).fireDays,
                                    color: const Color(0xffF08C38),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  StatisticsContainer(
                                      themeData: themeData,
                                      icon: "lib/assets/icons/score.svg",
                                      title: '${user?.score}%',
                                      subtitle: S.of(context).score,
                                      color: const Color(0xff2CBB5D)),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  StatisticsContainer(
                                      themeData: themeData,
                                      icon: "lib/assets/icons/quiz.svg",
                                      title: '${user?.answeredQuestionsCount}',
                                      subtitle: S.of(context).questions,
                                      color: const Color(0xffF66F3E)),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  StatisticsContainer(
                                      themeData: themeData,
                                      icon: "lib/assets/icons/accuracy.svg",
                                      title: '${user?.accuracy}%',
                                      subtitle: S.of(context).accuracy,
                                      color: const Color(0xffFE4346)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

