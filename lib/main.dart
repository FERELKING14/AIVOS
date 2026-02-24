import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:aivo/config/supabase_config.dart';
import 'package:aivo/core/localization/localization_provider.dart';
import 'package:aivo/route/route_constants.dart';
import 'package:aivo/route/router.dart' as router;
import 'package:aivo/theme/app_theme.dart';
import 'package:aivo/utils/db_explorer.dart';
import 'package:aivo/services/supabase_auth_service.dart';
import 'package:aivo/services/logger_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Request permissions early (but don't wait for them)
  if (Platform.isAndroid) {
    unawaited(Permission.manageExternalStorage.request());
  }

  // Initialize auth service EARLY - this MUST happen before app runs
  try {
    final authService = SupabaseAuthService();
    await authService.init();
    print('[STARTUP] Auth service initialized');
  } catch (e) {
    print('[STARTUP] Failed to init auth service: $e');
  }

  // Initialize logger service (non-blocking)
  try {
    final logger = LoggerService();
    unawaited(logger.init());
  } catch (e) {
    print('[STARTUP] Failed to init logger: $e');
  }

  // Initialize Supabase (non-blocking)
  if (supabaseUrl.isNotEmpty && supabasePublishableKey.isNotEmpty) {
    try {
      await Supabase.initialize(
        url: supabaseUrl,
        anonKey: supabasePublishableKey,
      );
      print('[STARTUP] Supabase initialized');
    } catch (e) {
      print('[STARTUP] Supabase init failed: $e');
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LocalizationProvider _localizationProvider;

  @override
  void initState() {
    super.initState();
    _localizationProvider = LocalizationProvider();
    _localizationProvider.initialize();
    _localizationProvider.addListener(_onLocaleChanged);
  }

  @override
  void dispose() {
    _localizationProvider.removeListener(_onLocaleChanged);
    _localizationProvider.dispose();
    super.dispose();
  }

  void _onLocaleChanged() {
    setState(() {
      // Rebuild widget tree when locale changes
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use the singleton instance that was initialized in main()
    final authService = SupabaseAuthService();
    final initialRoute = authService.isFirstLaunch
      ? onbordingScreenRoute
      : entryPointScreenRoute;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AIVO - E-Commerce App',
      theme: AppTheme.lightTheme(context),
      themeMode: ThemeMode.light,
      locale: _localizationProvider.locale,
      supportedLocales: LocalizationProvider.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: router.generateRoute,
      initialRoute: initialRoute,
    );
  }
}

/// Provider for accessing localization from anywhere in the app
///
/// Usage:
/// ```dart
/// final localization = LocalizationProviderService.instance;
/// localization.setLocale(Locale('fr'));
/// ```
class LocalizationProviderService {
  static final LocalizationProvider _instance = LocalizationProvider();

  static LocalizationProvider get instance => _instance;
}

