import 'package:logger/logger.dart';

class LoggerService {
  static final LoggerService _instance = LoggerService._internal();
  late Logger _logger;

  LoggerService._internal() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
      output: ConsoleOutput(),
    );
  }

  factory LoggerService() {
    return _instance;
  }

  Future<void> init() async {
    // Logger package is ready immediately
    _logger.i('Logger service initialized');
  }

  void i(String message) => _logger.i(message);

  void d(String message) => _logger.d(message);

  void w(String message) => _logger.w(message);

  void e(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  Logger get logger => _logger;
}
