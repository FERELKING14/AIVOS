# 🛠️ Development Resources

Ce dossier contient tous les fichiers, scripts et documentation utiles pour le développement et la maintenance du projet AIVOS.

## 📁 Structure

```
dev/
├── sql/              # Scripts SQL pour Supabase
├── scripts/          # Scripts shell et utilitaires
├── md/              # Documentation Markdown
└── docs/            # Documents diverses
```

## 📊 SQL Scripts (`sql/`)

Scripts SQL pour initialiser et gérer la base de données Supabase.

- **`show_structure.sql`** - Affiche la structure complète des tables
- **`fill_db.sql`** - Remplissage basique des tables
- **`fill_products_complete.sql`** - Insertion complète des produits avec images
- **`seed_data.sql`** - Données de démo

**Usage:**
```bash
# Dans Supabase Dashboard SQL Editor, copie-colle le contenu d'un fichier
cat dev/sql/show_structure.sql
```

## 🔧 Scripts (`scripts/`)

Scripts shell pour explorer et gérer Supabase via l'API.

- **`explore_db.sh`** - Explore la structure de la base de données
- **`get_db_structure.sh`** - Récupère les métadonnées des tables
- **`test_columns.sh`** - Teste les colonnes des tables
- **`SUPABASE_REMPLISSAGE.sh`** - Instructions pour remplir Supabase

**Usage:**
```bash
cd dev/scripts
bash explore_db.sh
bash get_db_structure.sh
```

## 📖 Documentation (`md/`)

- **`SUPABASE_SETUP.md`** - Guide complet d'intégration Supabase

## 🔐 Configuration

Pour développer localement:

1. **Créer un `.env` à la racine (non commité):**
   ```
   SUPABASE_URL=https://sbgstgpacvyomuimcfem.supabase.co
   SUPABASE_PUBLISH_KEY=sb_publishable_A_ZRr5De8Tg_-FLP5AvVeA_TRHJejH0
   ```

2. **Consulter `.env.example` pour le template**

## 🚀 Étapes Développement

### 1. Initialiser la DB
```bash
# Voir la structure
cat dev/sql/show_structure.sql

# Remplir les données (dans Supabase Dashboard)
cat dev/sql/fill_products_complete.sql
```

### 2. Tester la connexion
```bash
flutter run
# Vérifier los logs de supabase_explorer
```

### 3. Développer localement
- Tous les services sont dans `lib/services/`
- Les modèles dans `lib/models/`
- L'authentification dans les Auth screens

## 📝 Notes

- Ne jamais commiter le `.env` avec les vraies clés
- Les scripts SQL sont des exemples - adapter au besoin
- Les scripts shell nécessitent `curl` et `jq`

---

**Last Updated:** Feb 22, 2026
