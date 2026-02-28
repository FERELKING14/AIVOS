import 'package:flutter/material.dart';
import 'package:aivo/core/localization/localization_provider.dart';
import 'package:aivo/constants.dart';
import 'package:aivo/generated_l10n/app_localizations.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final localization = LocalizationProvider.instance;
    final supported = LocalizationProvider.getSupportedLocalesWithNames();
    final l10n = AppLocalizations.of(context)!;

    // Filtrage des langues
    final filtered = supported
        .where((e) => e.$2.toLowerCase().contains(_search.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.selectLanguage),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Barre de recherche
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: TextField(
              decoration: InputDecoration(
                hintText: l10n.searchLanguage,
                prefixIcon: const Icon(Icons.search, color: primaryColor),
                filled: true,
                fillColor: primaryColor.withValues(alpha: 0.05),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultBorderRadious),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (v) => setState(() => _search = v),
            ),
          ),
          // Liste des langues
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              itemCount: filtered.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, i) {
                final locale = filtered[i].$1;
                final name = filtered[i].$2;
                final flag = _getFlag(locale.languageCode);
                final isSelected =
                    localization.locale.languageCode == locale.languageCode;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? primaryColor.withValues(alpha: 0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(defaultBorderRadious),
                    border: Border.all(
                      color: isSelected
                          ? primaryColor
                          : Colors.grey.withValues(alpha: 0.2),
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Text(
                      flag,
                      style: const TextStyle(fontSize: 28),
                    ),
                    title: Text(
                      name,
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? primaryColor : Colors.black87,
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(Icons.check_circle, color: primaryColor)
                        : null,
                    onTap: () {
                      localization.setLocale(locale);
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  String _getFlag(String code) {
    switch (code) {
      case 'en':
        return '🇬🇧';
      case 'fr':
        return '🇫🇷';
      case 'sw':
        return '🇹🇿';
      case 'am':
        return '🇪🇹';
      case 'yo':
        return '🇳🇬';
      case 'zu':
        return '🇿🇦';
      default:
        return '🏳️';
    }
  }
}
