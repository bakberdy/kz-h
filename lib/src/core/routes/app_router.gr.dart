// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:kz_h/src/features/bottom_navigation/presentation/screens/bottom_navigation_bar.dart'
    as _i1;
import 'package:kz_h/src/features/home_feed/presentation/screens/home_feed.dart'
    as _i2;
import 'package:kz_h/src/features/auth/presentation/screens/profile_page.dart'
    as _i3;

/// generated route for
/// [_i1.BottomNavigationBarPage]
class BottomNavigationBarRoute extends _i4.PageRouteInfo<void> {
  const BottomNavigationBarRoute({List<_i4.PageRouteInfo>? children})
      : super(
          BottomNavigationBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigationBarRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.BottomNavigationBarPage();
    },
  );
}

/// generated route for
/// [_i2.HomeFeed]
class HomeFeed extends _i4.PageRouteInfo<void> {
  const HomeFeed({List<_i4.PageRouteInfo>? children})
      : super(
          HomeFeed.name,
          initialChildren: children,
        );

  static const String name = 'HomeFeed';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeFeed();
    },
  );
}

/// generated route for
/// [_i3.ProfilePage]
class ProfileRoute extends _i4.PageRouteInfo<void> {
  const ProfileRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.ProfilePage();
    },
  );
}
