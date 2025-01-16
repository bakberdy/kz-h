import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kz_h/src/core/themes/colors.dart';

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
        body: Column(
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
                            'lib/assets/images/KZH-logo.png'))),
                Positioned(
                  top: 20.h,
                    right: 20.w,
                    child: Image.asset('lib/assets/icons/settings.png'))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 18.h,
                  ),
                  Text(
                    "Yessentay Bakberdi",
                    style: themeData.headlineMedium,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "@bakberdy ~ Joined September 2024",
                    style: themeData.bodySmall
                        ?.copyWith(color: AppColors.secondaryTextColor),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Overview",
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
                        title: '77',
                        subtitle: 'Fire Days',
                        color: const Color(0xffF08C38),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      StatisticsContainer(
                          themeData: themeData,
                          icon: "lib/assets/icons/score.svg",
                          title: '77%',
                          subtitle: 'Score',
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
                          title: '77',
                          subtitle: 'Questions',
                          color: const Color(0xffF66F3E)),
                      const SizedBox(
                        width: 8,
                      ),
                      StatisticsContainer(
                          themeData: themeData,
                          icon: "lib/assets/icons/accuracy.svg",
                          title: '77',
                          subtitle: 'Accuracy',
                          color: const Color(0xffFE4346)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StatisticsContainer extends StatelessWidget {
  const StatisticsContainer({
    super.key,
    required this.themeData,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  final TextTheme themeData;
  final String icon;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(width: 1, color: AppColors.secondaryTextColor)),
        child: Row(
          children: [
            SizedBox(
              width: 5.w,
            ),
            SvgPicture.asset(icon),
            SizedBox(
              width: 10.w,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        height: 1,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: color),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(subtitle,
                      style: themeData.labelSmall?.copyWith(height: 1)),
                ]),
          ],
        ),
      ),
    );
  }
}
