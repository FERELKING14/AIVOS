import 'package:flutter/material.dart';
import 'package:aivo/constants.dart';
import 'package:aivo/main.dart';

/// Language selector widget for changing app language
///
/// Usage:
/// ```dart
/// LanguageSelector()
/// ```
/// This widget displays available languages and allows users to switch between them.
///
/// Note: After running `flutter gen-l10n`, you can use:
/// ```dart
/// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
///
/// Text(AppLocalizations.of(context)!.appTitle)
/// ```
class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = LocalizationProviderService.instance;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadious),
      ),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Language',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: defaultPadding),
            ..._buildLanguageOptions(context, localization),
            const SizedBox(height: defaultPadding),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildLanguageOptions(
    BuildContext context,
    LocalizationProvider localization,
  ) {
    return LocalizationProvider.getSupportedLocalesWithNames()
        .map((localeData) {
      final locale = localeData.$1;
      final name = localeData.$2;
      final isSelected =
          localization.instance.locale.languageCode == locale.languageCode;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ElevatedButton.icon(
          onPressed: () {
            localization.instance.setLocale(locale);
            Navigator.pop(context);
          },
          icon: isSelected
              ? const Icon(Icons.check_circle)
              : const Icon(Icons.language),
          label: Text(name),
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? primaryColor : Colors.grey[300],
            foregroundColor: isSelected ? Colors.white : Colors.black,
            minimumSize: const Size(double.infinity, 48),
          ),
        ),
      );
    }).toList();
  }
}

/// Language-aware list tile for preference screens
///
/// Usage:
/// ```dart
/// LanguagePreferenceTile()
/// ```
class LanguagePreferenceTile extends StatelessWidget {
  final VoidCallback? onTap;

  const LanguagePreferenceTile({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final localization = LocalizationProviderService.instance;
    final currentLang = LocalizationProvider.getLocaleName(
      localization.instance.locale,
    );

    return ListTile(
      leading: const Icon(Icons.language),
      title: const Text('Language'),
      subtitle: Text(currentLang),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        onTap?.call();
        showDialog(
          context: context,
          builder: (_) => const LanguageSelector(),
        );
      },
    );
  }
}
