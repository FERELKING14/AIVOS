import 'package:flutter/material.dart';
import 'package:aivo/core/localization/localization_provider.dart';
import 'package:aivo/constants.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

    @override
      State<LanguageScreen> createState() => _LanguageScreenState();
      }

      class _LanguageScreenState extends State<LanguageScreen> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final localization = LocalizationProvider.of(context);
    final supported = LocalizationProvider.getSupportedLocalesWithNames();
    final filtered = supported.where((e) => e.$2.toLowerCase().contains(_search.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Langue')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Rechercher une langue',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (v) => setState(() => _search = v),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                final locale = filtered[i].$1;
                final name = filtered[i].$2;
                final flag = _getFlag(locale.languageCode);
                final isSelected = localization?.locale.languageCode == locale.languageCode;
                return ListTile(
                  leading: Text(flag, style: const TextStyle(fontSize: 24)),
                  title: Text(name),
                  trailing: isSelected ? const Icon(Icons.check, color: primaryColor) : null,
                  onTap: () {
                    localization?.setLocale(locale);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getFlag(String code) {
    switch (code) {
      case 'fr':
        return '🇫🇷';
      case 'en':
        return '🇬🇧';
      default:
        return '🏳️';
    }
  }
                                                                                                                                                                                                                                                                                    final flag = _getFlag(locale.languageCode);
                                                                                                                                                                                                                                                                                                    final isSelected = localization.locale.languageCode == locale.languageCode;
                                                                                                                                                                                                                                                                                                                    return ListTile(
                                                                                                                                                                                                                                                                                                                                      leading: Text(flag, style: const TextStyle(fontSize: 24)),
                                                                                                                                                                                                                                                                                                                                                        title: Text(name),
                                                                                                                                                                                                                                                                                                                                                                          trailing: isSelected ? const Icon(Icons.check, color: primaryColor) : null,
                                                                                                                                                                                                                                                                                                                                                                                            onTap: () {
                                                                                                                                                                                                                                                                                                                                                                                                                localization.setLocale(locale);
                                                                                                                                                                                                                                                                                                                                                                                                                                  },
                                                                                                                                                                                                                                                                                                                                                                                                                                                  );
                                                                                                                                                                                                                                                                                                                                                                                                                                                                },
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ],
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        );
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            String _getFlag(String code) {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                switch (code) {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      case 'fr':
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              return '🇫🇷';
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    case 'en':
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            return '🇬🇧';
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  default:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          return '🏳️';
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                }
