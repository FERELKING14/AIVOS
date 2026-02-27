import 'package:flutter/material.dart';

/// Manages application localization and language switching
///
/// This provider handles:
/// - Current language/locale selection
/// - Dynamic language switching without app restart
/// - Persistence of language preference
/// - Notification of locale changes to listeners
class LocalizationProvider extends ChangeNotifier {
  /// Global instance for accessing the provider
  static final LocalizationProvider instance = LocalizationProvider._internal();

  LocalizationProvider._internal();

  /// Factory constructor for easy instantiation
  factory LocalizationProvider() => instance;

  /// Supported locales in the application
  static const List<Locale> supportedLocales = [
    Locale('en'), // English
    Locale('fr'), // French
    Locale('am'), // Amharic
    Locale('sw'), // Swahili
    Locale('yo'), // Yoruba
    Locale('zu'), // Zulu
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

  /// Checks if current locale is Amharic
  bool get isAmharic => _locale.languageCode == 'am';

  /// Checks if current locale is Swahili
  bool get isSwahili => _locale.languageCode == 'sw';

  /// Checks if current locale is Yoruba
  bool get isYoruba => _locale.languageCode == 'yo';

  /// Checks if current locale is Zulu
  bool get isZulu => _locale.languageCode == 'zu';

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
  /// - Locale('en') → "🇺🇸 English"
  /// - Locale('fr') → "🇫🇷 Français"
  /// - Locale('am') → "🇪🇹 አማርኛ"
  static String getLocaleName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return '🇺🇸 English';
      case 'fr':
        return '🇫🇷 Français';
      case 'am':
        return '🇪🇹 አማርኛ';
      case 'sw':
        return '🇹🇿 Kiswahili';
      case 'yo':
        return '🇳🇬 Yorùbá';
      case 'zu':
        return '🇿🇦 isiZulu';
      default:
        return locale.languageCode;
    }
  }

  /// Gets a list of all supported locales with their display names
  ///
  /// Useful for building language selection UI
  static List<(Locale, String)> getSupportedLocalesWithNames() {
    return [
      (const Locale('en'), '🇺🇸 English'),
      (const Locale('fr'), '🇫🇷 Français'),
      (const Locale('am'), '🇪🇹 አማርኛ'),
      (const Locale('sw'), '🇹🇿 Kiswahili'),
      (const Locale('yo'), '🇳🇬 Yorùbá'),
      (const Locale('zu'), '🇿🇦 isiZulu'),
    ];
  }
}
