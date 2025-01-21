import 'package:auto_route/auto_route.dart';
import 'package:kz_h/src/core/routes/app_router.gr.dart';
import 'package:kz_h/src/core/routes/auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  AppRouter({super.navigatorKey});
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: BottomNavigationBarRoute.page,
      path: "/main",
      guards: [AuthGuard(false)],
      children: [
        AutoRoute(page: ProfileRoute.page, path: "profile"),
        AutoRoute(page: HomeFeed.page, path: "home_feed"),
      ],
    ),
    AutoRoute(
      page: OnboardingRoute.page,
      path: "/onboarding",
      initial: true,
    ),
    AutoRoute(page: LoginRoute.page, path: "/login",),
    AutoRoute(page: RegisterRoute.page, path: "/register"),
  ];
}
