part of 'index.dart';

class UtilLog {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      printTime: true,
      methodCount: 0,
    ),
  );

  static info(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  static warn(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  static trace(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.t(message, error: error, stackTrace: stackTrace);
  }

  static error(
    String message,
    Object e, {
    DateTime? time,
    StackTrace? stack,
  }) {
    _logger.e(message, error: e, stackTrace: stack);
  }

  static request(String type, String url, dynamic params) {
    trace('''
类型: $type
地址: $url
参数: $params''');
  }

  static response(String url, String type, dynamic data) {
    trace('''
地址: $url
状态: $type
数据: $data''');
  }

  static responseError(String url, String type, dynamic data) {
    _logger.e('''
地址: $url
状态: $type
数据: $data''');
  }
}
