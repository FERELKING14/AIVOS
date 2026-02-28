import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:aivo/services/logger_service.dart';

Future<void> inspectSupabaseDatabase() async {
  final client = Supabase.instance.client;

  try {
    // Récupérer info sur les tables via information_schema
    final tablesResponse = await client
        .from('information_schema.tables')
        .select(
          'table_name, table_schema',
        )
        .eq('table_schema', 'public');

    LoggerService().i('=== TABLES DANS SUPABASE ===');
    LoggerService().i(tablesResponse.toString());

    // Pour chaque table, afficher sa structure
    for (var tableInfo in tablesResponse as List) {
      final tableName = tableInfo['table_name'];
      LoggerService().i('\n📦 TABLE: $tableName');

      final columnsResponse = await client
          .from('information_schema.columns')
          .select(
            'column_name, data_type, is_nullable',
          )
          .eq('table_name', tableName);

      for (var col in columnsResponse as List) {
        LoggerService().i(
            '  - ${col['column_name']} (${col['data_type']}) ${col['is_nullable'] == 'NO' ? '[NOT NULL]' : '[NULL]'}');
      }
    }
  } catch (e) {
    LoggerService().i('Erreur: $e');
    LoggerService().i(
        '\n⚠️ Alternative: Essayons de lire directement depuis les tables principales...');

    // Essai direct
    try {
      final products = await client.from('products').select('*').limit(1);
      LoggerService().i('\n✅ TABLE: products (existe)');
      if (products.isNotEmpty) {
        LoggerService().i('Colonnes: ${(products[0] as Map).keys.toList()}');
      }
    } catch (_) {
      LoggerService().i('\n❌ TABLE: products (n\'existe pas)');
    }

    try {
      final categories = await client.from('categories').select('*').limit(1);
      LoggerService().i('\n✅ TABLE: categories (existe)');
      if (categories.isNotEmpty) {
        LoggerService().i('Colonnes: ${(categories[0] as Map).keys.toList()}');
      }
    } catch (_) {
      LoggerService().i('\n❌ TABLE: categories (n\'existe pas)');
    }

    try {
      final users = await client.from('profiles').select('*').limit(1);
      LoggerService().i('\n✅ TABLE: profiles (existe)');
      if (users.isNotEmpty) {
        LoggerService().i('Colonnes: ${(users[0] as Map).keys.toList()}');
      }
    } catch (_) {
      LoggerService().i('\n❌ TABLE: profiles (n\'existe pas)');
    }

    try {
      await client.auth.getUser();
      LoggerService().i('\n✅ Auth: Configurée');
    } catch (_) {
      LoggerService().i('\n⚠️ Auth: Pas initialisée');
    }
  }
}
