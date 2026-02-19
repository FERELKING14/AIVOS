# AIVO Localization System

## Overview

AIVO uses Flutter's official `flutter_localizations` and `intl` packages for multilingual support. The system supports:
- **English (en)**
- **French (fr)**

Dynamic language switching without app restart is implemented using a `LocalizationProvider` (ChangeNotifier pattern).

---

## Directory Structure

```
lib/
├── l10n/                                    # Localization files
│   ├── app_en.arb                          # English translations
│   └── app_fr.arb                          # French translations
└── core/localization/                       # Localization provider & utilities
    ├── localization_provider.dart           # ChangeNotifier for locale management
    ├── language_selector.dart               # UI components for language selection
    └── app_localizations_extension.dart     # Context extensions

l10n.yaml                                     # Flutter L10n configuration
```

---

## Configuration

### 1. Dependencies (pubspec.yaml)

Required packages:
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: ^0.19.0
```

### 2. L10n Configuration (l10n.yaml)

```yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
output-class: AppLocalizations
output-dir: lib/generated_l10n
nullable-getter: true
synthetic-package: false
format: icu
flutter_intl:
  enabled: true
```

### 3. MaterialApp Configuration (main.dart)

```dart
MaterialApp(
  locale: _localizationProvider.locale,
  supportedLocales: LocalizationProvider.supportedLocales,
  localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  // ... other config
)
```

---

## Usage

### 1. Generate Localization Files

After adding/modifying .arb files, generate the localization dart code:

```bash
flutter gen-l10n
```

This generates:
- `lib/generated_l10n/app_localizations.dart` (English)
- `lib/generated_l10n/app_localizations_fr.dart` (French)

### 2. Using Translated Strings in Code

#### Method 1: Direct Import (Recommended for type safety)

```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Text(l10n.appTitle);  // Automatically translated based on locale
  }
}
```

#### Method 2: Using Generated Method

```dart
String title = AppLocalizations.of(context)!.productDetails;
String itemCount = AppLocalizations.of(context)!.cartItemsCount(5);
```

### 3. Changing Language Dynamically

```dart
import 'package:aivo/main.dart';

// Access the localization provider
final localization = LocalizationProviderService.instance;

// Change locale
localization.setLocale(const Locale('fr'));

// Or by language code
localization.setLanguageCode('en');

// Or toggle between languages
localization.toggleLanguage();

// Check current language
if (localization.isEnglish) {
  // Current language is English
}
```

### 4. Using Language Selector UI

In your Preferences or Settings screen:

```dart
import 'package:aivo/core/localization/language_selector.dart';

class PreferencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Other settings...
          LanguagePreferenceTile(
            onTap: () => print('Language changing'),
          ),
        ],
      ),
    );
  }
}
```

Or show language selector dialog:

```dart
showDialog(
  context: context,
  builder: (_) => const LanguageSelector(),
);
```

---

## Adding New Translations

### Step 1: Update .arb Files

**lib/l10n/app_en.arb** (English):
```json
{
  "myNewKey": "My Translation",
  "greetUser": "Hello, {name}!",
  "{name}": {
    "description": "The name of the user",
    "type": "String"
  }
}
```

**lib/l10n/app_fr.arb** (French):
```json
{
  "myNewKey": "Ma Traduction",
  "greetUser": "Bonjour, {name}!",
  "{name}": {
    "description": "Le nom de l'utilisateur",
    "type": "String"
  }
}
```

### Step 2: Generate Code

```bash
flutter gen-l10n
```

### Step 3: Use in Code

```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final l10n = AppLocalizations.of(context)!;
Text(l10n.myNewKey);  // "My Translation" in English, "Ma Traduction" in French
Text(l10n.greetUser(name: 'John'));  // "Hello, John!" in English
```

---

## Translation Key Conventions

- **Snake_case**: For key names (`product_details`, `add_to_cart`)
- **English values**: Default/template language
- **Consistent naming**: Use prefixes for related keys:
  - `bottom_nav_*`: Bottom navigation items
  - `product_*`: Product-related strings
  - `order_*`: Order-related strings
  - `error_*`: Error messages

---

## Dynamic Content in Translations

### Plurals

```json
{
  "cartItemsCount": "{count, plural, =0{No items} =1{1 item} other{{count} items}}"
}
```

Usage:
```dart
l10n.cartItemsCount(5)  // "5 items"
l10n.cartItemsCount(1)  // "1 item"
```

### Named Parameters

```json
{
  "welcomeUser": "Welcome, {firstName} {lastName}!",
  "firstName": {"type": "String"},
  "lastName": {"type": "String"}
}
```

Usage:
```dart
l10n.welcomeUser(firstName: 'John', lastName: 'Doe')
```

---

## LocalizationProvider API

### Properties

- `locale` - Current Locale
- `languageCode` - Current language code (e.g., 'en', 'fr')
- `isEnglish` - Boolean check if English
- `isFrench` - Boolean check if French

### Methods

- `initialize()` - Initialize with system locale or saved preference
- `setLocale(Locale)` - Set locale instance
- `setLanguageCode(String)` - Set locale by string code
- `toggleLanguage()` - Switch between English/French
- `getLocaleName(Locale)` - Get display name (e.g., "English", "Français")
- `getSupportedLocalesWithNames()` - List all locales with names

### ChangeNotifier Integration

```dart
// Create listener for language changes
_localizationProvider.addListener(() {
  print('Language changed to: ${_localizationProvider.languageCode}');
});

// Remove listener
_localizationProvider.removeListener(callback);

// Or extend with ChangeNotifierConsumer (requires provider package)
```

---

## Integration with Preferences Screen

Modify `lib/screens/preferences/views/preferences_screen.dart`:

```dart
import 'package:aivo/core/localization/language_selector.dart';

class PreferencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferences')),
      body: ListView(
        children: [
          const SizedBox(height: defaultPadding),
          // Language preference with selector
          LanguagePreferenceTile(),
          const Divider(),
          // Other preferences...
        ],
      ),
    );
  }
}
```

---

## Best Practices

### 1. **Always Use Context.of()**

```dart
// ✅ Good - Get localization every rebuild
final l10n = AppLocalizations.of(context)!;

// ❌ Bad - Cache outside build method
final l10n = AppLocalizations.of(context);  // May become stale
```

### 2. **Prefix Related Keys**

```dart
// ✅ Good
appTitle
bottomNavShop
productDetails
productPrice

// ❌ Bad
title
shop_nav
details
price
```

### 3. **Handle Null Safety**

```dart
// ✅ Safe
Text(AppLocalizations.of(context)!.someKey)

// With null check
final l10n = AppLocalizations.of(context);
if (l10n != null) {
  Text(l10n.someKey)
}
```

### 4. **Document Localized Strings**

In .arb files, add descriptions:

```json
{
  "productDetails": "Product Details",
  "@productDetails": {
    "description": "Title shown on product details screen"
  }
}
```

---

## Supported Locales

Current support:
- **English (en)** - Default
- **French (fr)**

To add a new language (e.g., Spanish):

1. Create `lib/l10n/app_es.arb`
2. Add all translations from English template
3. Update `localization_provider.dart`:

```dart
static const List<Locale> supportedLocales = [
  Locale('en'),
  Locale('fr'),
  Locale('es'),  // New
];

static String getLocaleName(Locale locale) {
  // ... existing cases ...
  case 'es':
    return 'Español';
  default:
    return locale.languageCode;
}
```

4. Update language selector:

```dart
static List<(Locale, String)> getSupportedLocalesWithNames() {
  return [
    (const Locale('en'), 'English'),
    (const Locale('fr'), 'Français'),
    (const Locale('es'), 'Español'),  // New
  ];
}
```

5. Run `flutter gen-l10n`

---

## Troubleshooting

### Error: "AppLocalizations not found"

**Solution**: Run code generation:
```bash
flutter clean
flutter pub get
flutter gen-l10n
```

### Translations not changing when locale updates

**Ensure**: You're using `AppLocalizations.of(context)` inside `build()` method, not caching outside.

### Missing translations for new keys

**Solution**:
1. Add key to `app_en.arb`
2. Add same key to `app_fr.arb`
3. Run `flutter gen-l10n`

### Performance concerns with locale changes

**Note**: Rebuilding entire app on locale change is by design. For large apps, consider:
- Using Provider package with `Selector` for widgets
- Separating screens that need locale updates from static content

---

## Testing Translations

### Unit Test Example

```dart
test('English locale available', () {
  final provider = LocalizationProvider();
  provider.setLocale(const Locale('en'));
  expect(provider.isEnglish, true);
  expect(provider.languageCode, 'en');
});

test('French locale available', () {
  final provider = LocalizationProvider();
  provider.setLocale(const Locale('fr'));
  expect(provider.isFrench, true);
});
```

### Widget Test Example

```dart
testWidgets('Language changes update widgets', (WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());

  // Verify English content
  expect(find.text('English'), findsOneWidget);

  // Change language
  LocalizationProviderService.instance.setLocale(const Locale('fr'));
  await tester.pumpAndSettle();

  // Verify French content
  expect(find.text('Français'), findsOneWidget);
});
```

---

## Performance Considerations

- **Language switching**: App rebuilds entire widget tree (design decision)
- **Translation lookups**: O(1) - constant time
- **Memory usage**: ~100KB for all translations
- **Build time**: Minimal impact from code generation

---

## Files Modified/Added

### New Files
- `lib/l10n/app_en.arb`
- `lib/l10n/app_fr.arb`
- `lib/core/localization/localization_provider.dart`
- `lib/core/localization/app_localizations_extension.dart`
- `lib/core/localization/language_selector.dart`
- `l10n.yaml`
- `lib/generated_l10n/` (generated after `flutter gen-l10n`)

### Modified Files
- `lib/main.dart` - Added localization initialization
- `pubspec.yaml` - Added flutter_localizations and intl dependencies

---

## Next Steps

1. **Run code generation**: `flutter gen-l10n`
2. **Integrate LanguageSelector** into preferences screen
3. **Replace hardcoded strings** in existing screens with l10n calls:
   ```dart
   // Before
   Text("Home")

   // After
   Text(AppLocalizations.of(context)!.homeTitle)
   ```
4. **Test language switching** across all screens
5. **Add more translations** as needed for additional content

---

**System Status**: ✅ Ready for implementation
**Last Updated**: February 2025
