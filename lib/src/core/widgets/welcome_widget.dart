import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kz_h/src/core/routes/app_router.gr.dart';
import 'package:kz_h/src/core/themes/colors.dart';
import 'package:kz_h/src/features/auth/presentation/widgets/filled_button.dart';

class WelcomWidget extends StatelessWidget {
  const WelcomWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(children: [
      SizedBox(
        height: 10.h,
      ),
      Text(
        'Добро пожаловать в KZH!',
        textAlign: TextAlign.center,
        style: themeData.textTheme.headlineMedium,
      ),
      SizedBox(
        height: 10.h,
      ),
      Text(
          style: themeData.textTheme.labelSmall,
          textAlign: TextAlign.center,
          'Откройте для себя возможность \nинтерактивно учить историю Казахстана благодаря нашей платформе KZH.'),
      SizedBox(
        height: 20.h,
      ),
      SizedBox(
        height: 65.h,
        width: double.infinity,
        child: MyFilledButton(
          borderColor: AppColors.bluePurpleColor,
          textColor: AppColors.bluePurpleColor,
          text: 'Войти в систему',
          onPressed: () {
            context.router.replaceAll([const OnboardingRoute()]);
          },
          bgColor: Colors.transparent,
        ),
      )
    ]);
  }
}
