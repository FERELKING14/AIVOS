import 'package:flutter/material.dart';

/// Manages application localization and language switching
///
/// This provider handles:
/// - Current language/locale selection
/// - Dynamic language switching without app restart
/// - Persistence of language preference
/// - Notification of locale changes to listeners
class LocalizationProvider extends ChangeNotifier {
  // Cette méthode est supprimée car _MyAppState n'existe pas ici.
  // Utilisez une instance globale ou un Provider si besoin d'accès contextuel.
  /// Supported locales in the application
  static const List<Locale> supportedLocales = [
    Locale('en'), // English
    Locale('fr'), // French
  ];

  /// Default locale
  static const Locale defaultLocale = Locale('en');

  /// Current locale
  Locale _locale = defaultLocale;

  /// Returns the current locale
  Locale get locale => _locale;

  /// Returns the current language code (e.g., 'en', 'fr')
  String get languageCode => _locale.languageCode;

  /// Checks if current locale is English
  bool get isEnglish => _locale.languageCode == 'en';

  /// Checks if current locale is French
  bool get isFrench => _locale.languageCode == 'fr';

  /// Initialize localization provider with system locale or saved preference
  ///
  /// In a real app, you might retrieve saved preference from local storage:
  /// ```dart
  /// final savedLocale = await _preferences.getString('locale');
  /// if (savedLocale != null) {
  ///   _locale = Locale(savedLocale);
  /// }
  /// ```
  void initialize() {
    // For now, using system locale detection
    final systemLocale = WidgetsBinding.instance.window.locale;
    if (_isLocaleSupported(systemLocale)) {
      _locale = systemLocale;
    }
    notifyListeners();
  }

  /// Sets the locale dynamically and notifies listeners
  ///
  /// This triggers a rebuild of widgets listening to this provider,
  /// effectively changing the app language without restart.
  ///
  /// Example:
  /// ```dart
  /// localizationProvider.setLocale(Locale('fr'));
  /// ```
  void setLocale(Locale locale) {
    if (_isLocaleSupported(locale)) {
      _locale = locale;
      // TODO: Save preference to local storage
      // await _preferences.setString('locale', locale.languageCode);
      notifyListeners();
    }
  }

  /// Sets locale by language code string
  ///
  /// Example:
  /// ```dart
  /// localizationProvider.setLanguageCode('fr');
  /// ```
  void setLanguageCode(String code) {
    setLocale(Locale(code));
  }

  /// Toggles between English and French
  void toggleLanguage() {
    if (_locale.languageCode == 'en') {
      setLocale(const Locale('fr'));
    } else {
      setLocale(const Locale('en'));
    }
  }

  /// Validates if a locale is supported
  bool _isLocaleSupported(Locale locale) {
    return supportedLocales.any(
      (supportedLocale) =>
          supportedLocale.languageCode == locale.languageCode,
    );
  }

  /// Gets the display name for a locale
  ///
  /// Example outputs:
  /// - Locale('en') → "English"
  /// - Locale('fr') → "Français"
  static String getLocaleName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'fr':
        return 'Français';
      default:
        return locale.languageCode;
    }
  }

  /// Gets a list of all supported locales with their display names
  ///
  /// Useful for building language selection UI
  static List<(Locale, String)> getSupportedLocalesWithNames() {
    return [
      (const Locale('en'), 'English'),
      (const Locale('fr'), 'Français'),
    ];
  }
}
