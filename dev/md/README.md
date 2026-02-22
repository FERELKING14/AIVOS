# Documentation

Guidescomplets et documentation pour comprendre l'architecture et les intégrations.

## Fichiers

### `SUPABASE_SETUP.md`
Guide complet d'intégration Supabase incluant:

- **Dépendances ajoutées**
  - supabase_flutter 2.5.0
  - flutter_dotenv 5.1.0
  - shared_preferences 2.2.2

- **Architecture implémentée**
  - SupabaseAuthService (singleton)
  - Login/Signup/Logout/Password Reset
  - First Launch tracking
  - Session management

- **Routes & Navigation**
  - Onboarding une seule fois
  - EntryPoint par défaut
  - Login/Logout depuis Profile

- **Models & Sérialisation**
  - ProductModel avec fromJson/toJson
  - CategoryModel avec fromJson/toJson
  - Mapping Supabase → Dart

## Structure de Développement

### Services (`lib/services/`)
```
lib/services/
├── supabase_auth_service.dart     # Authentification
├── supabase_service.dart          # Accès aux données
```

### Models (`lib/models/`)
```
lib/models/
├── product_model.dart             # Produits
├── category_model.dart            # Catégories
```

### Auth Screens (`lib/screens/auth/`)
```
lib/screens/auth/views/
├── login_screen.dart              # Login avec Supabase
├── signup_screen.dart             # Signup avec Supabase
├── password_recovery_screen.dart  # Reset password
├── components/
│   ├── login_form.dart
│   └── sign_up_form.dart
```

### Profile (`lib/screens/profile/`)
```
lib/screens/profile/views/
├── profile_screen.dart            # Login/Logout dynamique
├── components/
│   ├── profile_card.dart
│   └── profile_menu_item_list_tile.dart
```

## Flux d'Authentification

```
App Start
  ↓
[First Launch?]
  ├─ YES → OnBoardingScreen
  │         ↓
  │      [User skips or completes]
  │         ↓
  │      EntryPointScreen
  │
  └─ NO → EntryPointScreen (default)

EntryPointScreen
  └─ Profile Tab
     ├─ [Not Logged In]
     │  ├─ LOGIN BUTTON → LoginScreen
     │  └─ Can browse without auth
     │
     └─ [Logged In]
        ├─ Show email
        ├─ LOGOUT BUTTON
        └─ Full profile menu
```

## Configuration & Secrets

### `.env` (Non-commité)
```
SUPABASE_URL=https://sbgstgpacvyomuimcfem.supabase.co
SUPABASE_PUBLISH_KEY=sb_publishable_...
```

### `.env.example` (Template)
```
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_PUBLISH_KEY=sb_publishable_xxxxx
```

### `.gitignore`
```
.env
.env.local
.env.*.local
```

## Bonnes Pratiques

1. **Ne jamais pusher le .env**
   - Utiliser `.env.example` comme template
   - Les secrets sont chargés au runtime

2. **Utiliser la Publish Key côté client**
   - PAS de Service Role Key en client
   - La Publish Key est publique par design

3. **Persister l'état avec SharedPreferences**
   - First launch tracking
   - User preferences
   - Skip flags

4. **Erreur Handling**
   - SnackBar pour feedback utilisateur
   - Containers rouges pour les erreurs de form
   - Try/catch partout avec logs

5. **Loading States**
   - Buttons disabled pendant async ops
   - Spinner icon pendant loading
   - Prévient les double soumissions

## Dépannage

### "column X does not exist"
→ Vérifier la structure réelle de la table
→ Utiliser `bash dev/scripts/explore_db.sh`
→ Adapter les noms de colonnes dans les models

### "anon key invalid"
→ Vérifier le `.env` a les bonnes clés
→ Vérifier les clés dans Supabase dashboard
→ Utiliser la PUBLISH KEY, pas Service Role

### "User not found after login"
→ Vérifier que le compte existe dans Supabase
→ Vérifier l'état auth: `authService.isLoggedIn`
→ Vérifier les logs Firebase/Supabase

## Ressources

- [Supabase Flutter Docs](https://supabase.com/docs/reference/flutter/introduction)
- [Flutter Dot ENV](https://pub.dev/packages/flutter_dotenv)
- [SharedPreferences](https://pub.dev/packages/shared_preferences)

---

**Last Updated:** Feb 22, 2026
