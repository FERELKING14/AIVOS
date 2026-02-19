# Integration Examples

This document shows practical examples of how to integrate translated strings into AIVO screens.

## Before & After Examples

### Example 1: Profile Screen Language Setting

**Before (hardcoded):**
```dart
// lib/screens/profile/views/profile_screen.dart
ProfileMenuListTile(
  svgSrc: "assets/icons/world_map.svg",
  title: "Language",  // ❌ Hardcoded
  press: () {
    // Language selection logic
  },
)
```

**After (with translations):**
```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aivo/core/localization/language_selector.dart';

ProfileMenuListTile(
  svgSrc: "assets/icons/world_map.svg",
  title: AppLocalizations.of(context)!.language,  // ✅ Translated
  press: () {
    showDialog(
      context: context,
      builder: (_) => const LanguageSelector(),
    );
  },
)
```

---

### Example 2: Home Screen Section Titles

**Before (hardcoded):**
```dart
Text(
  "Popular Products",  // ❌ Hardcoded
  style: Theme.of(context).textTheme.titleLarge,
)
```

**After (with translations):**
```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Text(
  AppLocalizations.of(context)!.popularProducts,  // ✅ Translated
  style: Theme.of(context).textTheme.titleLarge,
)
```

---

### Example 3: Button Labels

**Before (hardcoded):**
```dart
ElevatedButton(
  child: const Text("Add to Cart"),  // ❌ Hardcoded
  onPressed: () {},
)
```

**After (with translations):**
```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

ElevatedButton(
  child: Text(AppLocalizations.of(context)!.addToCart),  // ✅ Translated
  onPressed: () {},
)
```

---

### Example 4: Pluralized Strings

**Before (manual logic):**
```dart
Text(
  _cartItems.length == 1
    ? "1 item in cart"
    : "${_cartItems.length} items in cart"
)
```

**After (with translations):**
```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Text(
  AppLocalizations.of(context)!.cartItemsCount(_cartItems.length)
)
```

---

### Example 5: Dynamic Content

**Before (string concatenation):**
```dart
Text('Welcome, $firstName $lastName!')
```

**After (with translations):**
```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Text(
  AppLocalizations.of(context)!.welcomeUser(
    firstName: firstName,
    lastName: lastName,
  )
)
```

---

## Screen-by-Screen Integration Plan

### Priority 1: User-Facing Navigation & Menus

**Screens to update:**
- [ ] `ProfileScreen` - Add language selector, translate menu items
- [ ] `PreferencesScreen` - Translate all settings labels
- [ ] `EntryPoint` - Translate bottom navigation labels (in theme, see below)
- [ ] `OnBordingScreen` - Translate onboarding text

**Code locations:**
```
lib/screens/profile/views/profile_screen.dart
lib/screens/preferences/views/preferences_screen.dart
lib/entry_point.dart
lib/screens/onbording/views/onbording_screnn.dart
```

**Key strings to replace:**
- Navigation labels: "Shop", "Discover", "Bookmark", "Bag", "Profile"
- Menu titles: "Settings", "Help & Support", "About App"
- Buttons: "Edit Profile", "Logout", "Save"

### Priority 2: Product-Related Content

**Screens to update:**
- [ ] `ProductDetailsScreen` - Translate product sections
- [ ] `ProductReviewsScreen` - Translate review UI
- [ ] `HomeScreen` - Translate section headers and product cards
- [ ] `DiscoverScreen` - Translate category labels

**Code locations:**
```
lib/screens/product/views/product_details_screen.dart
lib/screens/reviews/view/product_reviews_screen.dart
lib/screens/home/views/home_screen.dart
lib/screens/discover/views/discover_screen.dart
```

### Priority 3: Forms & Input

**Screens to update:**
- [ ] `LoginScreen` - Translate labels and messages
- [ ] `SignUpScreen` - Translate form labels
- [ ] `AddressesScreen` - Translate form fields
- [ ] `UserInfoScreen` - Translate user form

**Key strings:**
- "Email Address", "Password", "Full Name"
- "Next", "Continue", "Submit"
- Validation errors: "Field is required", "Invalid email"

### Priority 4: Checkout & Orders

**Screens to update:**
- [ ] `CartScreen` - Translate cart labels
- [ ] `OrdersScreen` - Translate order status and buttons
- [ ] `WalletScreen` - Translate wallet labels

---

## Implementation Steps

### Step 1: Generate Localization Code

```bash
flutter clean
flutter pub get
flutter gen-l10n
```

This creates:
- `lib/generated_l10n/app_localizations.dart`
- `lib/generated_l10n/app_localizations_fr.dart`

### Step 2: Update Main.dart (Already Done)

✅ Already implemented in `/workspaces/AIVOS/lib/main.dart`

### Step 3: Update ProfileScreen Example

```dart
// lib/screens/profile/views/profile_screen.dart

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aivo/core/localization/language_selector.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: ListView(
        children: [
          // ... ProfileCard ...

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: Text(
                    l10n.settings,  // "Settings" or "Paramètres"
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                ProfileMenuListTile(
                  svgSrc: "assets/icons/world_map.svg",
                  title: l10n.language,  // Translated
                  press: () {
                    showDialog(
                      context: context,
                      builder: (_) => const LanguageSelector(),
                    );
                  },
                ),
                // ... other menu items with translations ...
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

### Step 4: Add Language Selection UI

The `LanguageSelector` widget is already available:

```dart
import 'package:aivo/core/localization/language_selector.dart';

// Show as dialog
showDialog(
  context: context,
  builder: (_) => const LanguageSelector(),
);

// Or use in-line in a screen
LanguagePreferenceTile()
```

### Step 5: Update Other Screens Iteratively

For each screen:
1. Add import: `import 'package:flutter_gen/gen_l10n/app_localizations.dart';`
2. Get localizations in build: `final l10n = AppLocalizations.of(context)!;`
3. Replace hardcoded strings: `"Text"` → `l10n.textKey`
4. Test in both English and French

---

## Common Patterns

### Pattern 1: List of Items with Headers

```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.myListTitle,  // Translated header
          style: Theme.of(context).textTheme.titleLarge,
        ),
        ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].name),
              subtitle: Text(l10n.mySubtitle),  // Translated
            );
          },
        ),
      ],
    );
  }
}
```

### Pattern 2: Forms with Validation

```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyForm extends StatefulWidget {
  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: l10n.email,  // Translated
              hintText: l10n.enterEmail,  // Translated
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return l10n.fieldRequired;  // Translated error
              }
              return null;
            },
          ),
          SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Submit form
              }
            },
            child: Text(l10n.submit),  // Translated
          ),
        ],
      ),
    );
  }
}
```

### Pattern 3: Dynamic Lists with Pluralization

```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartCounter extends StatelessWidget {
  final int itemCount;

  const CartCounter({required this.itemCount});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Text(
      l10n.cartItemsCount(itemCount),  // "5 items" or "1 item"
    );
  }
}
```

---

## Testing Translations

### Test 1: Locale Switching

```dart
void main() {
  testWidgets('Language changes update UI', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Initial language (English)
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('Langue'), findsNothing);

    // Switch to French
    final localization = LocalizationProviderService.instance;
    localization.setLocale(const Locale('fr'));
    await tester.pumpAndSettle();

    // Verify French
    expect(find.text('Language'), findsNothing);
    expect(find.text('Langue'), findsOneWidget);
  });
}
```

### Test 2: Translation Completeness

```dart
test('All English keys have French translations', () {
  final enFile = jsonDecode(File('lib/l10n/app_en.arb').readAsStringSync());
  final frFile = jsonDecode(File('lib/l10n/app_fr.arb').readAsStringSync());

  for (String key in enFile.keys) {
    expect(
      frFile.containsKey(key),
      true,
      reason: 'Missing French translation for "$key"',
    );
  }
});
```

---

## Debugging

### Check Current Locale

```dart
void _debugLocale(BuildContext context) {
  print('Current locale: ${Localizations.localeOf(context)}');
  print('System locale: ${WidgetsBinding.instance.window.locale}');
}
```

### Verify String Generation

```bash
# After running flutter gen-l10n, check generated files
ls -la lib/generated_l10n/

# Should contain:
# - app_localizations.dart
# - app_localizations_en.dart
# - app_localizations_fr.dart
# - messages_all.dart
# - messages_en.dart
# - messages_fr.dart
```

### Test Specific LocalizationProvider

```dart
test('LocalizationProvider locale switching', () {
  final provider = LocalizationProvider();

  expect(provider.locale.languageCode, 'en');
  provider.setLocale(const Locale('fr'));
  expect(provider.locale.languageCode, 'fr');
  expect(provider.isFrench, true);
  expect(provider.isEnglish, false);
});
```

---

## Migration Checklist

- [ ] Run `flutter gen-l10n`
- [ ] Update `main.dart` (✅ already done)
- [ ] Update `lib/pubspec.yaml` (✅ already done)
- [ ] Translate ProfileScreen
- [ ] Translate PreferencesScreen
- [ ] Translate HomeScreen
- [ ] Translate ProductDetailsScreen
- [ ] Translate Auth screens (LoginScreen, SignUpScreen)
- [ ] Translate Address screens
- [ ] Translate Cart & Order screens
- [ ] Test language switching on all screens
- [ ] Add more translations as needed
- [ ] Test on both English and French

---

**Status**: Ready for screen-by-screen implementation
**Date**: February 2025
