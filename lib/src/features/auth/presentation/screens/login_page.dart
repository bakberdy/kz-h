import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validation/form_validation.dart';
import 'package:kz_h/src/core/themes/colors.dart';
import 'package:kz_h/src/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:kz_h/src/features/auth/presentation/widgets/filled_button.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final usernameOrEmailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> submit() async {
    isLoading = true;
    setState(() {});
    final usernameOrEmail = usernameOrEmailController.text;
    final password = passwordController.text;
    await Future.delayed(Duration(seconds: 3));
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'lib/assets/images/splash-bg.png',
                      )),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 172.h,
                        ),
                        SvgPicture.asset('lib/assets/images/kzh_logo.svg'),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('LOGIN',
                            style: themeData.textTheme.bodyMedium
                                ?.copyWith(color: Colors.white))
                      ],
                    ),
                    SizedBox(height: 25.h),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 354.w,
                            child: AuthInputField(
                              controller: usernameOrEmailController,
                              hintText: 'Username or Email',
                              validator: (value) {
                                final validator = Validator(validators: [
                                  const RequiredValidator(),
                                  //  const EmailValidator()
                                ]);
                                return validator.validate(
                                    label: 'Email or Username', value: value);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            width: 354.w,
                            child: AuthInputField(
                              controller: passwordController,
                              obscuredText: true,
                              hintText: 'Password',
                              validator: (value) {
                                final validator = Validator(validators: [
                                  const MinLengthValidator(length: 6),
                                  const RequiredValidator(),
                                ]);
                                return validator.validate(
                                    label: 'Password', value: value);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          SizedBox(
                            height: 60.h,
                            width: 354.w,
                            child: MyFilledButton(
                                text: 'SIGN IN',
                                onPressed: () async {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    await submit();
                                    print('Form is valid');
                                  } else {
                                    print('Form is invalid');
                                  }
                                },
                                bgColor: AppColors.bluePurpleColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          
          isLoading?Positioned(
              child: Container(
                color: Colors.black.withValues(alpha: 0.7),
                child: Center(
                            child: CircularProgressIndicator(color: AppColors.bluePurpleColor),
                          ),
              )):Positioned(
              left: 16.w,
              top: 25.h,
              child: GestureDetector(
                  onTap: () {
                    context.router.maybePop();
                  },
                  child: Image.asset('lib/assets/icons/back.png'))),
          
        ],
      ),
    );
  }
}
