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
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void submit() {
    final username = usernameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    context.read<AuthBloc>().add(RegisterRequested(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        username: username));
    print('Submit method');
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          final currentRoute = context.router.current.name;
          print(currentRoute);
          // Проверяем текущий маршрут
          if (currentRoute == 'LoginRoute' || currentRoute == 'RegisterRoute') {
            context.router.pushNamed('/main');
          }
        } else if (state is AuthError) {
          print(state.message);
          BotToast.showText(
              contentColor: Colors.red,
              text: state.message,
              textStyle: TextStyle(fontSize: 16.sp));
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
                          Text('REGISTER',
                              style: themeData.textTheme.bodyMedium
                                  ?.copyWith(color: Colors.white))
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 354.w,
                              child: AuthInputField(
                                controller: usernameController,
                                hintText: 'Username',
                                validator: (value) {
                                  final validator = Validator(validators: [
                                    const RequiredValidator(),
                                    //  const EmailValidator()
                                  ]);
                                  return validator.validate(
                                      label: 'Username', value: value);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              width: 354.w,
                              child: AuthInputField(
                                controller: emailController,
                                hintText: 'Email',
                                validator: (value) {
                                  final validator = Validator(validators: [
                                    const RequiredValidator(),
                                    const EmailValidator()
                                  ]);
                                  return validator.validate(
                                      label: 'Email', value: value);
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
                              height: 10.h,
                            ),
                            SizedBox(
                              width: 354.w,
                              child: AuthInputField(
                                controller: confirmPasswordController,
                                obscuredText: true,
                                hintText: 'Confirm password',
                                validator: (value) {
                                  final validator = Validator(validators: [
                                    const MinLengthValidator(length: 6),
                                    const RequiredValidator(),
                                  ]);
                                  return validator.validate(
                                      label: 'Confirm Password', value: value);
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
                                  text: 'SIGN UP',
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      print('Form is valid');
                                      submit();
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
