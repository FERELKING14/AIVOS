import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Theme color accent options
enum ThemeAccent {
  purple, // Default
  blue,
  green,
  orange,
  red,
}

/// Theme contrast options
enum ThemeContrast {
  normal,
  high,
}

class ThemeProvider extends ChangeNotifier {
  static final ThemeProvider _instance = ThemeProvider._internal();

  factory ThemeProvider() {
    return _instance;
  }

  ThemeProvider._internal();

  late SharedPreferences _prefs;
  ThemeMode _themeMode = ThemeMode.system;
  ThemeAccent _accent = ThemeAccent.purple;
  ThemeContrast _contrast = ThemeContrast.normal;

  ThemeMode get themeMode => _themeMode;
  ThemeAccent get accent => _accent;
  ThemeContrast get contrast => _contrast;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    // Load saved preferences
    final savedTheme = _prefs.getString('themeMode');
    if (savedTheme != null) {
      _themeMode = ThemeMode.values.firstWhere(
        (e) => e.toString() == savedTheme,
        orElse: () => ThemeMode.system,
      );
    }

    final savedAccent = _prefs.getString('themeAccent');
    if (savedAccent != null) {
      _accent = ThemeAccent.values.firstWhere(
        (e) => e.toString() == savedAccent,
        orElse: () => ThemeAccent.purple,
      );
    }

    final savedContrast = _prefs.getString('themeContrast');
    if (savedContrast != null) {
      _contrast = ThemeContrast.values.firstWhere(
        (e) => e.toString() == savedContrast,
        orElse: () => ThemeContrast.normal,
      );
    }
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    _prefs.setString('themeMode', mode.toString());
    notifyListeners();
  }

  void setAccent(ThemeAccent accent) {
    _accent = accent;
    _prefs.setString('themeAccent', accent.toString());
    notifyListeners();
  }

  void setContrast(ThemeContrast contrast) {
    _contrast = contrast;
    _prefs.setString('themeContrast', contrast.toString());
    notifyListeners();
  }

  /// Get primary color based on accent
  Color getPrimaryColor() {
    switch (_accent) {
      case ThemeAccent.purple:
        return const Color(0xFF7B61FF);
      case ThemeAccent.blue:
        return const Color(0xFF1F7EFF);
      case ThemeAccent.green:
        return const Color(0xFF00B366);
      case ThemeAccent.orange:
        return const Color(0xFFFF9800);
      case ThemeAccent.red:
        return const Color(0xFFFF4444);
    }
  }
}
