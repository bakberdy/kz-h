import 'package:auto_route/auto_route.dart';
import 'package:kz_h/src/core/routes/app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final bool isAuthenticated;

  // Example: Pass the auth state (e.g., from a provider or service)
  AuthGuard(this.isAuthenticated);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isAuthenticated) {
      // Allow navigation
      resolver.next(true);
    } else {
      // Redirect to login if not authenticated
      router.push(const OnboardingRoute());
    }
  }
}
