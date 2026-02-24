# 🔒 AIVO Build Configuration & Secrets Management

## Overview

AIVO uses **`--dart-define`** for environment variables instead of `.env` files. This approach:
- ✅ Keeps secrets out of the Git repository
- ✅ Works seamlessly with CI/CD
- ✅ Follows Flutter best practices
- ✅ Supports local development and production builds

---

## 🚀 Local Development

### 1. Build with Supabase (Optional)

To enable Supabase features locally:

```bash
flutter run \
  --dart-define=SUPABASE_URL=your_supabase_url \
  --dart-define=SUPABASE_PUBLISHABLE_KEY=your_supabase_publishable_key
```

Or for release APK:

```bash
flutter build apk \
  --target-platform android-arm64 \
  --release \
  --split-per-abi \
  --dart-define=SUPABASE_URL=your_supabase_url \
  --dart-define=SUPABASE_PUBLISHABLE_KEY=your_supabase_publishable_key
```

### 2. Build Without Supabase

If Supabase is not configured, the app will still work with mock data:

```bash
flutter run
```

Or:

```bash
flutter build apk --target-platform android-arm64 --release --split-per-abi
```

---

## 🔑 GitHub Actions Setup

### Add Secrets to GitHub Repository

1. Go to: **GitHub Repository → Settings → Secrets and variables → Actions**

2. Click **"New repository secret"** and add:

| Secret Name | Value |
|---|---|
| `SUPABASE_URL` | `https://your-project.supabase.co` |
| `SUPABASE_PUBLISHABLE_KEY` | `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...` |

### Example Secret Values

```
SUPABASE_URL=https://xyzdemo.supabase.co
SUPABASE_PUBLISHABLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Note:** Use the **Publishable/Anonymous Key** (public key), NOT the Service Role Key. The publishable key is safe to use in client applications.

---

## 🛡️ Security Best Practices

### ✅ DO

- Use `SUPABASE_ANON_KEY` (public key, safe for client apps)
- Keep `Service Role Key` and `Database Password` safe
- Use GitHub Secrets for sensitive data
- Rotate keys regularly

### ❌ DON'T

- Never commit `.env` files to Git
- Never use `Service Role Key` in client apps
- Never hardcode secrets in code
- Never share credentials in commits

---

## 📝 Environment Variables Reference

### Available dart-define Variables

```dart
// In your code, access via String.fromEnvironment:
const String supabaseUrl = String.fromEnvironment('SUPABASE_URL', defaultValue: '');
const String supabasePublishableKey = String.fromEnvironment('SUPABASE_PUBLISHABLE_KEY', defaultValue: '');
```

See `lib/config/environment.dart` for the complete configuration class.

---

## 🔄 Building Without Supabase

If you don't have Supabase credentials yet or want to test without it:

```bash
# App will use mock data
flutter run

# Or build APK
flutter build apk --release
```

The app gracefully handles missing Supabase configuration and shows a warning.

---

## 📚 Files Modified for Secrets Management

- `lib/config/environment.dart` - Environment configuration class
- `lib/main.dart` - Updated initialization logic
- `.github/workflows/build-apk.yml` - CI/CD with GitHub Secrets
- `pubspec.yaml` - Removed `flutter_dotenv` dependency
- `.gitignore` - Ensures `.env*` files are never committed

---

## Need Help?

- Check the logs: `flutter build apk -v` (verbose mode)
- Test locally first before pushing to GitHub
- Use `--dart-define` with multiple values as needed
