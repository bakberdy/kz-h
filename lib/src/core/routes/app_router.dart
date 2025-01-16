import 'package:auto_route/auto_route.dart';
import 'package:kz_h/src/core/routes/app_router.gr.dart';
import 'package:kz_h/src/features/auth/presentation/screens/onboarding_screen.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final bool isLoggedIn;

  AppRouter({super.navigatorKey, required this.isLoggedIn});
  @override
  List<AutoRoute> get routes => [
    isLoggedIn?AutoRoute(
      page: BottomNavigationBarRoute.page,
      path: "/",
      children: [
        AutoRoute(page: ProfileRoute.page, path: "profile"),
        AutoRoute(page: HomeFeed.page, path: "home_feed"),
      ],
    ):AutoRoute(
      page: OnboardingRoute.page,
      path: "/onboarding",
      children: [
        AutoRoute(page: LoginRoute.page, path: "login"),
        AutoRoute(page: RegisterRoute.page, path: "register"),
      ],
    ),
  ];
}
