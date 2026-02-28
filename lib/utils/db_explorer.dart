// Script pour explorer la structure Supabase
// À exécuter une fois dans main() pour voir l'état de la DB

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:aivo/services/logger_service.dart';

Future<void> exploreSupabase() async {
  final client = Supabase.instance.client;

  LoggerService().i('\n\n========== 🔍 SUPABASE DATABASE INSPECTION ==========\n');

  // 1. Tester la connexion
  try {
    await client.from('information_schema.tables').select().limit(1);
    LoggerService().i('✅ Connexion à Supabase: OK\n');
  } catch (e) {
    LoggerService().i('❌ Connexion: Échouée - $e\n');
    return;
  }

  // 2. Chercher toutes les tables
  LoggerService().i('📋 TABLES EXISTANTES:\n');

  final tablesList = [
    'products',
    'categories',
    'users',
    'profiles',
    'orders',
    'bookmarks',
    'cart_items'
  ];

  for (String tableName in tablesList) {
    try {
      final response = await client.from(tableName).select('*').limit(1);
      LoggerService().i('✅ $tableName');
      LoggerService().i(
          '   Colonnes: ${(response.isNotEmpty ? (response[0] as Map).keys.toList() : 'VIDE').toString()}');
      LoggerService().i('   Nombre de lignes: ${response.length}');
      if (response.isNotEmpty) {
        LoggerService().i('   Exemple: ${response[0]}');
      }
      LoggerService().i('');
    } catch (e) {
      final errorMsg = e.toString();
      if (errorMsg.contains('does not exist')) {
        LoggerService().i('❌ $tableName (n\'existe pas)');
      } else {
        LoggerService().i('⚠️  $tableName (erreur: ${e.toString().split('\n').first})');
      }
      LoggerService().i('');
    }
  }

  // 3. Check Auth
  LoggerService().i('\n🔐 AUTHENTIFICATION:\n');
  try {
    final user = await client.auth.getUser();
    LoggerService().i(
        '✅ Auth initialisée - User: ${user.user?.email ?? 'Aucun utilisateur connecté'}');
  } catch (e) {
    LoggerService().i('⚠️  Auth check: ${e.toString().split('\n').first}');
  }

  LoggerService().i('\n========== FIN INSPECTION ==========\n');
}
