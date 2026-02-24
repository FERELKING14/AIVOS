import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class LoggerService {
  static final LoggerService _instance = LoggerService._internal();
  late File _logFile;
  late String _logPath;
  bool _initialized = false;

  LoggerService._internal();

  factory LoggerService() {
    return _instance;
  }

  Future<void> init() async {
    if (_initialized) return;
    try {
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
      final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-').split('.')[0];
      _logPath = '${logsDir.path}/aivo_$timestamp.log';
      _logFile = File(_logPath);
      await _logFile.writeAsString('[INIT] Logger service initialized at $_logPath\n');
      if (androidDataPath != null) {
        print('Logger: dossier Android/data utilisé: $androidDataPath');
      }
      _initialized = true;
    } catch (e) {
      print('ERROR: Failed to initialize logger: $e');
      _logPath = '/data/unknown';
    }
  }

  Future<void> _write(String level, String message, {dynamic error, StackTrace? stackTrace}) async {
    final timestamp = DateTime.now().toIso8601String();
    final logLine = '[$timestamp][$level] $message';
    String details = '';
    if (error != null) details += '\nError: $error';
    if (stackTrace != null) details += '\nStackTrace: $stackTrace';
    final fullLog = '$logLine$details\n';
    // Affiche aussi dans la console
    print(fullLog);
    try {
      await _logFile.writeAsString(fullLog, mode: FileMode.append);
    } catch (e) {
      print('ERROR writing log: $e');
    }
  }

  void i(String message) => _write('INFO', message);
  void d(String message) => _write('DEBUG', message);
  void w(String message) => _write('WARN', message);
  void e(String message, [dynamic error, StackTrace? stackTrace]) => _write('ERROR', message, error: error, stackTrace: stackTrace);

  Future<String> getLogPath() async => _logPath;
  Future<String> getLogContent() async {
    try {
      return await _logFile.readAsString();
    } catch (e) {
      return 'Error reading log file: $e';
    }
  }
}
