import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:aivo/config/environment.dart';
import 'package:aivo/core/localization/localization_provider.dart';
import 'package:aivo/route/route_constants.dart';
import 'package:aivo/route/router.dart' as router;
import 'package:aivo/theme/app_theme.dart';
import 'package:aivo/utils/db_explorer.dart';
import 'package:aivo/services/supabase_auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Debug: Print environment configuration
  print('=== AIVO App Startup ===');
  print('Supabase URL: ${Environment.supabaseUrl.isEmpty ? '❌ NOT SET' : '✅ ${Environment.supabaseUrl}'}');
  print('Supabase Key: ${Environment.supabasePublishableKey.isEmpty ? '❌ NOT SET' : '✅ ${Environment.supabasePublishableKey.substring(0, 20)}...'}');
  print('Supabase Configured: ${Environment.isSupabaseConfigured ? '✅ YES' : '❌ NO'}');
  print('========================\n');

  try {
    // Initialize Supabase only if credentials are provided via dart-define
    if (Environment.isSupabaseConfigured) {
      print('🔄 Initializing Supabase...');
      await Supabase.initialize(
        url: Environment.supabaseUrl,
        anonKey: Environment.supabasePublishableKey,
      );
      print('✅ Supabase initialized successfully');

      // Initialize Auth Service
      final authService = SupabaseAuthService();
      await authService.init();
      print('✅ Auth service initialized');
    } else {
      print('⚠️ Supabase not configured. Build with --dart-define flags.');
      print('flutter build apk --dart-define=SUPABASE_URL=... --dart-define=SUPABASE_PUBLISHABLE_KEY=...');
    }
  } catch (e) {
    // Supabase optional - app can work without it
    print('❌ Supabase initialization failed: $e');
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
    // Determine initial route based on auth state and first launch
    final authService = SupabaseAuthService();
    String initialRoute = onbordingScreenRoute;

    if (!authService.isFirstLaunch) {
      initialRoute = entryPointScreenRoute;
    }

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

