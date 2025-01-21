// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:kz_h/src/features/auth/presentation/screens/login_page.dart'
    as _i3;
import 'package:kz_h/src/features/auth/presentation/screens/onboarding_screen.dart'
    as _i4;
import 'package:kz_h/src/features/auth/presentation/screens/profile_page.dart'
    as _i5;
import 'package:kz_h/src/features/auth/presentation/screens/register.dart'
    as _i6;
import 'package:kz_h/src/features/bottom_navigation/presentation/screens/bottom_navigation_bar.dart'
    as _i1;
import 'package:kz_h/src/features/home_feed/presentation/screens/home_feed.dart'
    as _i2;

/// generated route for
/// [_i1.BottomNavigationBarPage]
class BottomNavigationBarRoute extends _i7.PageRouteInfo<void> {
  const BottomNavigationBarRoute({List<_i7.PageRouteInfo>? children})
    : super(BottomNavigationBarRoute.name, initialChildren: children);

  static const String name = 'BottomNavigationBarRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.BottomNavigationBarPage();
    },
  );
}

/// generated route for
/// [_i2.HomeFeed]
class HomeFeed extends _i7.PageRouteInfo<void> {
  const HomeFeed({List<_i7.PageRouteInfo>? children})
    : super(HomeFeed.name, initialChildren: children);

  static const String name = 'HomeFeed';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeFeed();
    },
  );
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginPage();
    },
  );
}

/// generated route for
/// [_i4.OnboardingScreen]
class OnboardingRoute extends _i7.PageRouteInfo<void> {
  const OnboardingRoute({List<_i7.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute({List<_i7.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProfilePage();
    },
  );
}

/// generated route for
/// [_i6.RegisterPage]
class RegisterRoute extends _i7.PageRouteInfo<void> {
  const RegisterRoute({List<_i7.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.RegisterPage();
    },
  );
}
