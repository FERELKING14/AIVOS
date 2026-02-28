import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aivo/services/logger_service.dart';

class SupabaseAuthService {
  static final SupabaseAuthService _instance = SupabaseAuthService._internal();
  late final SupabaseClient _supabase;
  late final SharedPreferences _prefs;
  bool _initialized = false;

  factory SupabaseAuthService() {
    return _instance;
  }

  SupabaseAuthService._internal() {
    try {
      _supabase = Supabase.instance.client;
    } catch (e) {
      LoggerService().e('[ERROR] Failed to get Supabase client: $e');
    }
  }

  // Initialize SharedPreferences
  Future<void> init() async {
    if (_initialized) return;
    try {
      _prefs = await SharedPreferences.getInstance();
      _initialized = true;
    } catch (e) {
      LoggerService().e('[ERROR] Failed to init SharedPreferences: $e');
    }
  }

  // ===================== AUTHENTICATION =====================

  // Get current user
  User? get currentUser => _supabase.auth.currentUser;

  // Check if user is logged in
  bool get isLoggedIn => _supabase.auth.currentUser != null;

  // Get user email
  String? get userEmail => _supabase.auth.currentUser?.email;

  // LOGIN with email or phone
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final logger = LoggerService();
      logger.i('🔐 Attempting login for: $email');
      
      // Try to login with email directly
      try {
        final response = await _supabase.auth.signInWithPassword(
          email: email,
          password: password,
        );
        logger.i('✅ Login successful for: $email');
        return response;
      } catch (e) {
        // If email login fails and input might be a phone, try to find user by phone
        if (!email.contains('@')) {
          logger.i('📱 Trying to login with phone number: $email');
          try {
            final result = await _supabase
                .from('user_profiles')
                .select('user_id')
                .eq('phone_number', email)
                .single();
            
            if (result != null && result['user_id'] != null) {
              // Get user email from auth table
              final userEmail = await _getUserEmailById(result['user_id']);
              if (userEmail != null) {
                final response = await _supabase.auth.signInWithPassword(
                  email: userEmail,
                  password: password,
                );
                logger.i('✅ Login successful with phone number');
                return response;
              }
            }
          } catch (phoneError) {
            logger.e('Phone lookup failed: $phoneError');
          }
        }
        rethrow;
      }
    } catch (e) {
      final logger = LoggerService();
      logger.e('❌ Login failed: $e', e);
      rethrow;
    }
  }

  // Helper method to get user email by ID
  Future<String?> _getUserEmailById(String userId) async {
    try {
      final result = await _supabase
          .from('user_profiles')
          .select('email')
          .eq('user_id', userId)
          .single();
      return result['email'];
    } catch (e) {
      return null;
    }
  }

  // SIGN UP
  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final logger = LoggerService();
      logger.i('📝 Attempting signup for: $email');
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      logger.i('✅ Signup successful for: $email');
      return response;
    } catch (e) {
      final logger = LoggerService();
      logger.e('❌ Signup failed: $e', e);
      rethrow;
    }
  }

  // CREATE USER PROFILE with additional information
  Future<void> createUserProfile({
    required String userId,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? countryCode,
    String? countryName,
    String userType = 'buyer',
  }) async {
    try {
      final logger = LoggerService();
      logger.i('💾 Creating user profile for: $userId');
      
      await _supabase.from('user_profiles').upsert({
        'user_id': userId,
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber,
        'country_code': countryCode,
        'country': countryName,
        'user_type': userType,
        'updated_at': DateTime.now().toIso8601String(),
      });
      
      logger.i('✅ User profile created successfully');
    } catch (e) {
      final logger = LoggerService();
      logger.e('❌ Failed to create user profile: $e', e);
      rethrow;
    }
  }

  // LOGOUT
  Future<void> logout() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  // RESET PASSWORD (Forgot Password)
  Future<void> resetPassword({required String email}) async {
    try {
      await _supabase.auth.resetPasswordForEmail(
        email,
        redirectTo: 'io.supabase.aivo://reset-password',
      );
    } catch (e) {
      rethrow;
    }
  }

  // UPDATE PASSWORD
  Future<void> updatePassword({required String newPassword}) async {
    try {
      await _supabase.auth.updateUser(
        UserAttributes(password: newPassword),
      );
    } catch (e) {
      rethrow;
    }
  }

  // ===================== FIRST LAUNCH TRACKING =====================

  // Check if this is the first launch
  bool get isFirstLaunch {
    if (!_initialized) {
      LoggerService().w('[WARNING] Auth service not initialized, assuming first launch');
      return true;
    }
    final hasShown = _prefs.getBool('onboarding_shown') ?? false;
    return !hasShown;
  }

  // Mark onboarding as shown
  Future<void> markOnboardingAsShown() async {
    if (!_initialized) {
      LoggerService().w('[WARNING] Auth service not initialized, cannot mark onboarding');
      return;
    }
    await _prefs.setBool('onboarding_shown', true);
  }

  // Reset onboarding (for testing)
  Future<void> resetOnboarding() async {
    if (!_initialized) {
      LoggerService().w('[WARNING] Auth service not initialized, cannot reset onboarding');
      return;
    }
    await _prefs.setBool('onboarding_shown', false);
  }

  // ===================== USER PREFERENCES =====================

  // Savoir si l'utilisateur a cliqué SKIP lors du premier lancement
  bool get hasSkippedInitialAuth {
    if (!_initialized) {
      return false;
    }
    return _prefs.getBool('skipped_initial_auth') ?? false;
  }

  // Mark that user skipped auth
  Future<void> markSkippedInitialAuth() async {
    if (!_initialized) {
      LoggerService().w('[WARNING] Auth service not initialized, cannot mark skip');
      return;
    }
    await _prefs.setBool('skipped_initial_auth', true);
  }

  // Reset skip flag (for testing)
  Future<void> resetSkipFlag() async {
    if (!_initialized) {
      LoggerService().w('[WARNING] Auth service not initialized, cannot reset skip');
      return;
    }
    await _prefs.setBool('skipped_initial_auth', false);
  }
}
