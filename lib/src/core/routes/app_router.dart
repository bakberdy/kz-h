import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kz_h/src/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({super.navigatorKey});

  Widget _slideTransition(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(position: offsetAnimation, child: child);
  }

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: BottomNavigationBarRoute.page,
          path: "/main",
          initial: true,
          // guards: [AuthGuard(false)],
          children: [
            AutoRoute(
              page: ProfileRoute.page,
              path: "profile",
            ),
            AutoRoute(page: HomeFeed.page, path: "home_feed"),
          ],
        ),
        AutoRoute(
            page: OnboardingRoute.page, path: "/onboarding", initial: false),
        AutoRoute(page: LoginRoute.page, path: "/login"),
        AutoRoute(page: RegisterRoute.page, path: "/register"),
        CustomRoute(
          page: SettingsRoute.page,
          path: "/settings",
          transitionsBuilder: _slideTransition,
          durationInMilliseconds: 200,
          fullscreenDialog: false,
        ),
        CustomRoute(
          page: ProfileEditRoute.page,
          path: "/profile_edit",
          transitionsBuilder: _slideTransition,
          durationInMilliseconds: 200,
          fullscreenDialog: false,
        ),
      ];
}
