import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kz_h/src/core/themes/colors.dart';
import 'package:kz_h/src/core/utils/show_accept_to_back_dialog.dart';
import 'package:kz_h/src/core/widgets/my_outlined_button.dart';
import 'package:kz_h/src/features/auth/presentation/widgets/edit_input_field.dart';
import 'package:kz_h/src/features/auth/presentation/widgets/my_filled_button.dart';
import 'package:kz_h/src/features/auth/presentation/widgets/small_filled_button.dart';

@RoutePage()
class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});
  static const secondaryColor = Color(0xff3A3A3A);

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
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.transparent, // Фиксированный цвет
            ),
          ),
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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 125.r,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff7D7D7D)),
                ),
                const SizedBox(
                  height: 7,
                ),
                SmallFilledButton(
                  secondaryColor: secondaryColor,
                  text: 'Edit avatar',
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                const EditInputField(
                    secondaryColor: secondaryColor, label: 'Username'),
                const EditInputField(
                    secondaryColor: secondaryColor, label: 'First name'),
                const EditInputField(
                    secondaryColor: secondaryColor, label: 'Last name'),
                const EditInputField(
                    secondaryColor: secondaryColor, label: 'Email'),
                Row(
                  children: [
                    Text('Email not verified.',
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColors.secondaryTextColor,
                        )),
                    SizedBox(width: 3),
                    Text('Verify now',
                        style: TextStyle(
                          decorationColor: Color(0xff5348F2),
                          decoration: TextDecoration.underline,
                          fontSize: 10,
                          color: Color(0xff5348F2),
                        )),
                  ],
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SaveChangesButton(
                    themeData: themeData,
                    onTap: () {},
                    isEnabled: true,
                  ),
                ),
                SizedBox(height: 8),
                Divider(thickness: 1, color: Color(0xff91898C)),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Password',
                        style: themeData.textTheme.labelSmall
                            ?.copyWith(letterSpacing: -0.5)),
                    SmallFilledButton(
                        secondaryColor: secondaryColor,
                        text: 'Change password',
                        onTap: () {})
                  ],
                ),
                SizedBox(height: 5),
                Divider(thickness: 1, color: Color(0xff91898C)),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delete my account',
                        style: themeData.textTheme.labelSmall
                            ?.copyWith(letterSpacing: -0.5)),
                    SizedBox(
                        height: 25.h,
                        width: 120.w,
                        child: MyOutlinedButton(text: 'Delete', onTap: () {}))
                  ],
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SaveChangesButton extends StatelessWidget {
  const SaveChangesButton({
    super.key,
    required this.themeData,
    this.isEnabled = true,
    required this.onTap,
  });

  final ThemeData themeData;
  final bool isEnabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      height: 25,
      child: FilledButton(
          style: ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
              backgroundColor: WidgetStatePropertyAll(isEnabled
                  ? Color(0xff3DBA60)
                  : Color.fromARGB(255, 2, 51, 5))),
          onPressed: isEnabled ? onTap : null,
          child: Text('SAVE CHANGES',
              style: themeData.textTheme.bodySmall?.copyWith(
                  letterSpacing: -0.5,
                  fontSize: 10,
                  color: isEnabled ? null : AppColors.secondaryTextColor))),
    );
  }
}
