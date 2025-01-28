import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kz_h/generated/l10n.dart';
import 'package:kz_h/src/features/auth/presentation/widgets/filled_button.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(   
                  'lib/assets/images/splash-bg.png',
                )),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 172.h,
                  ),
                  SvgPicture.asset('lib/assets/images/kzh_logo.svg'),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 60.h,
                    width: 354.w,
                    child: MyFilledButton(
                      bgColor: const Color(0xff5348F2),
                      onPressed: () {
                        context.router.pushNamed('/login');
                       },text: S.of(context).login),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 60.h,
                    width: 354.w,
                    child:MyFilledButton(text: S.of(context).register, onPressed: () {
                          AutoRouter.of(context).pushNamed('/register');
                        }, bgColor: const Color(0xff272727))   
                  ),
                  SizedBox(height: 120.h,)
                ],
              ),
            ],
          )),
    );
  }
}

