import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  final _logger = Logger(
    filter: _LogFilter(),
    printer: _LogPrinter("DIO LOGGER"),
    output: _LogOutput([ConsoleOutput()]),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String message = "REQUEST -> ${options.method} ${options.uri}";
    String logMessage = _formatLog(message);

    _logger.t(logMessage);
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final base = response.requestOptions;
    String message =
        "RESPONSE <- ${response.statusCode} ${base.method} ${base.uri}";
    String logMessage = _formatLog(message);

    _logger.i(logMessage);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message =
        "ERROR <- ${err.response?.statusCode ?? 'Unknown'} ${err.requestOptions.method} ${err.requestOptions.uri}";
    String logMessage = _formatLog(message);

    _logger.e(logMessage);
    handler.next(err);
  }

  String _formatLog(String message) {
    int length = message.length;
    String border = "╔${"═" * (length + 2)}╗";
    String bottomBorder = "╚${"═" * (length + 2)}╝";
    return '''
$border
║ $message ║
$bottomBorder
''';
  }
}

class _LogPrinter extends LogPrinter {
  final String className;

  _LogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    var emoji = PrettyPrinter.defaultLevelEmojis[event.level] ?? "";
    var output = '$emoji $className\n${event.message}';
    return output.split('\n');
  }
}

class _LogOutput extends LogOutput {
  final List<LogOutput> logOutputs;

  _LogOutput(this.logOutputs);

  @override
  void output(OutputEvent event) {
    for (var logOutput in logOutputs) {
      logOutput.output(event);
    }
  }
}

class _LogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
