import 'package:get_it/get_it.dart';
import 'package:kz_h/src/core/routes/app_router.dart';
import 'package:kz_h/src/features/home_feed/home_feed_injection_container.dart';

final sl = GetIt.instance;

Future<void> initDependencies()async {
  sl.registerSingleton<AppRouter>(AppRouter(isLoggedIn: true));
  await initHomeDi();
}