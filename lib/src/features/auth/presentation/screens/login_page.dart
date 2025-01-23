import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_validation/form_validation.dart';
import 'package:kz_h/src/core/themes/colors.dart';
import 'package:kz_h/src/features/auth/presentation/blocs/auth_bloc/bloc/auth_bloc.dart';
import 'package:kz_h/src/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:kz_h/src/features/auth/presentation/widgets/filled_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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

  Future<void> submit() async {
    final usernameOrEmail = usernameOrEmailController.text.trim();
    final password = passwordController.text.trim();
    context.read<AuthBloc>().add(
        LoginRequested(emailOrUsername: usernameOrEmail, password: password));
  }

  @override
  void dispose() {
    usernameOrEmailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          context.router.pushNamed('/main/home_feed');
        } else if (state is AuthError) {
          print(state.message);
          BotToast.showText(text: state.message, contentColor: Colors.red);
        }
      },
      child: Scaffold(
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
            BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              return (state is AuthLoading)
                  ? Positioned(
                      child: Container(
                      color: Colors.black.withValues(alpha: 0.7),
                      child: Center(
                        child: LoadingAnimationWidget.fourRotatingDots(
                            size: 60.sp, color: AppColors.bluePurpleColor),
                      ),
                    ))
                  : Positioned(
                      left: 16.w,
                      top: 25.h,
                      child: GestureDetector(
                          onTap: () {
                            context.router.maybePop();
                          },
                          child: Image.asset('lib/assets/icons/back.png')));
            }),
          ],
        ),
      ),
    );
  }
}
