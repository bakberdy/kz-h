import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:kz_h/src/core/network/network_info.dart';
import 'package:kz_h/src/core/routes/app_router.dart';
import 'package:kz_h/src/features/auth/auth_injection_container.dart';
import 'package:kz_h/src/features/home_feed/home_feed_injection_container.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerSingleton<AppRouter>(AppRouter());
   // Core
  sl.registerLazySingleton(() => Connectivity());
  sl.registerSingleton<NetworkInfo>(
      NetworkInfoImpl(connectionChecker: sl())); 

  await initAuthDi();
  await initHomeDi();
  
}