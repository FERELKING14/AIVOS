import 'package:logger/logger.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class LoggerService {
  static final LoggerService _instance = LoggerService._internal();
  late Logger _logger;
  late File _logFile;
  late String _logPath;
  bool _initialized = false;

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
    if (_initialized) return;
    try {
      // Initialize file logging
      Directory logsDir;
      String? androidDataPath;
      if (defaultTargetPlatform == TargetPlatform.android) {
        // Dossier /storage/emulated/0/Android/data/<package>/
        final appDataDir = await getExternalStorageDirectory();
        if (appDataDir != null) {
          androidDataPath = appDataDir.path;
          final logsInData = Directory('$androidDataPath/logs');
          if (!await logsInData.exists()) {
            await logsInData.create(recursive: true);
          }
          logsDir = logsInData;
        } else {
          // Fallback dossier public
          logsDir = Directory('/storage/emulated/0/AIVO/logs');
        }
      } else {
        final appDocDir = await getApplicationDocumentsDirectory();
        logsDir = Directory('${appDocDir.path}/AIVO/logs');
      }
      if (!await logsDir.exists()) {
        await logsDir.create(recursive: true);
      }
      final timestamp =
          DateTime.now().toIso8601String().replaceAll(':', '-').split('.')[0];
      _logPath = '${logsDir.path}/aivo_$timestamp.log';
      _logFile = File(_logPath);
      await _logFile.writeAsString('[INIT] Logger service initialized at $_logPath\n');
      if (androidDataPath != null) {
        _logger.i('Logger directory: $androidDataPath');
      }
      _initialized = true;
    } catch (e) {
      _logger.e('Failed to initialize file logger', error: e);
      _logPath = '/data/unknown';
    }
  }

  Future<void> _writeToFile(String level, String message,
      {dynamic error, StackTrace? stackTrace}) async {
    if (!_initialized) return;
    try {
      final timestamp = DateTime.now().toIso8601String();
      final logLine = '[$timestamp][$level] $message';
      String details = '';
      if (error != null) details += '\nError: $error';
      if (stackTrace != null) details += '\nStackTrace: $stackTrace';
      final fullLog = '$logLine$details\n';
      await _logFile.writeAsString(fullLog, mode: FileMode.append);
    } catch (e) {
      // Silent fail for file operations
    }
  }

  void i(String message) {
    _logger.i(message);
    _writeToFile('INFO', message);
  }

  void d(String message) {
    _logger.d(message);
    _writeToFile('DEBUG', message);
  }

  void w(String message) {
    _logger.w(message);
    _writeToFile('WARN', message);
  }

  void e(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
    _writeToFile('ERROR', message, error: error, stackTrace: stackTrace);
  }

  Logger get logger => _logger;

  Future<String> getLogPath() async => _logPath;

  Future<String> getLogContent() async {
    if (!_initialized) return 'Logger not initialized';
    try {
      return await _logFile.readAsString();
    } catch (e) {
      return 'Error reading log file: $e';
    }
  }
}
