import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Абстрактный класс для проверки доступности интернета
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// Реализация проверки интернет-соединения с использованием InternetConnectionChecker
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfoImpl({required this.internetConnectionChecker});

  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}