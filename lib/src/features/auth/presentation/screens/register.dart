import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validation/form_validation.dart';
import 'package:kz_h/generated/l10n.dart';
import 'package:kz_h/src/core/themes/colors.dart';
import 'package:kz_h/src/core/utils/show_error.dart';
import 'package:kz_h/src/features/auth/presentation/blocs/auth_bloc/bloc/auth_bloc.dart';
import 'package:kz_h/src/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:kz_h/src/features/auth/presentation/widgets/my_filled_button.dart';
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
  }

  @override
  void dispose() {
    confirmPasswordController.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          final currentRoute = context.router.current.name;
          if (currentRoute == 'LoginRoute' || currentRoute == 'RegisterRoute') {
            context.router.pushNamed('/main');
          }
        } else if (state is AuthError) {
          showError(state.message);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
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
                              SvgPicture.asset(
                                  'lib/assets/images/kzh_logo.svg'),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(S.of(context).register.toUpperCase(),
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
                                    hintText: S.of(context).username,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  width: 354.w,
                                  child: AuthInputField(
                                    controller: emailController,
                                    hintText: S.of(context).email,
                                    validator: (value) {
                                      final validator = Validator(validators: [
                                        const RequiredValidator(),
                                        const EmailValidator()
                                      ]);
                                      return validator.validate(
                                          label: S.of(context).email,
                                          value: value);
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
                                    hintText: S.of(context).password,
                                    validator: (value) {
                                      final validator = Validator(validators: [
                                        const MinLengthValidator(length: 6),
                                        const RequiredValidator(),
                                      ]);
                                      return validator.validate(
                                          label: S.of(context).password,
                                          value: value);
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
                                    hintText: S.of(context).confirmPassword,
                                    validator: (value) {
                                      final validator = Validator(validators: [
                                        const MinLengthValidator(length: 6),
                                        const RequiredValidator(),
                                      ]);
                                      return validator.validate(
                                          label: S.of(context).confirmPassword,
                                          value: value);
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
                                      text: S.of(context).register,
                                      onPressed: () {
                                        if (_formKey.currentState?.validate() ??
                                            false) {
                                          submit();
                                        }
                                      },
                                      bgColor: AppColors.bluePurpleColor),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 150.h,
                          )
                        ],
                      )),
                ),
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
                            child: SizedBox(
                                height: 40,
                                width: 60,
                                child:
                                    Image.asset('lib/assets/icons/back.png'))));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
