import 'package:auto_route/auto_route.dart';
import 'package:kz_h/src/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: BottomNavigationBarRoute.page, path: "/", children: [
          AutoRoute(page: ProfileRoute.page, path: "profile"),
          AutoRoute(page: HomeFeed.page, path: "home_feed")
        ]),
      ];
}
