import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kz_h/src/core/themes/colors.dart';
import 'package:kz_h/src/core/utils/show_accept_to_back_dialog.dart';
import 'package:kz_h/src/core/widgets/my_outlined_button.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await showAcceptToBackDialog(context) ?? false;
        if (shouldPop && context.mounted) {
          context.router.maybePop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () async {
              final shouldPop = await showAcceptToBackDialog(context) ?? false;
              if (shouldPop && context.mounted) {
                context.router.maybePop();
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SvgPicture.asset('lib/assets/icons/back.svg'),
            ),
          ),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0.h),
            child: Column(
              children: [
                Container(
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 1, color: const Color(0xff282828)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7.r),
                            topRight: Radius.circular(7.r)),
                        child: SettingsItemHeader(
                            text: 'Settings', width: constraints.maxWidth),
                      ),
                      SettingsItemButton(
                          onTap: () {
                            context.router.pushNamed('/profile_edit');
                          },
                          text: 'Profile'),
                      SettingsItemButton(onTap: () {}, text: 'Preferences'),
                      SettingsItemButton(onTap: () {}, text: 'Sessions'),
                      SettingsItemHeader(
                          text: 'Support', width: constraints.maxWidth),
                      SettingsItemButton(onTap: () {}, text: 'Help Center'),
                      SettingsItemButton(onTap: () {}, text: 'About us'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 40.h,
                  width: constraints.maxWidth,
                  child: MyOutlinedButton(
                    text: 'Log out',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class SettingsItemHeader extends StatelessWidget {
  const SettingsItemHeader({
    super.key,
    required this.width,
    this.height = 40,
    required this.text,
  });
  final double width;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Color(0xff282828),
      ),
      child: Text(text),
    );
  }
}

class SettingsItemButton extends StatelessWidget {
  const SettingsItemButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: AppColors.bottomNavigationBarColor,
      splashColor: AppColors.bottomNavigationBarColor,
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(width: 0.5, color: Color(0xff282828)))),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 50.h,
        alignment: Alignment.centerLeft,
        child: Text(text),
      ),
    );
  }
}
