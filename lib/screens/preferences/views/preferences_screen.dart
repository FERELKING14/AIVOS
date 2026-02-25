import 'package:flutter/material.dart';
import 'package:aivo/constants.dart';

import 'components/prederence_list_tile.dart';


class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  final Map<String, bool> _prefs = {
    'Analytics': true,
    'Personalization': false,
    'Marketing': false,
    'Social media cookies': false,
  };

  void _reset() {
    setState(() {
      _prefs.updateAll((key, value) => false);
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Préférences réinitialisées')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Préférences cookies"),
        actions: [
          TextButton(
            onPressed: _reset,
            child: const Text("Reset"),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
        child: Column(
          children: [
            ..._prefs.entries.map((e) => Column(
              children: [
                PreferencesListTile(
                  titleText: e.key,
                  subtitleTxt: _getSubtitle(e.key),
                  isActive: e.value,
                  press: () {
                    setState(() {
                      _prefs[e.key] = !_prefs[e.key]!;
                    });
                  },
                ),
                const Divider(height: defaultPadding * 2),
              ],
            )),
          ],
        ),
      ),
    );
  }

  String _getSubtitle(String key) {
    switch (key) {
      case 'Analytics':
        return "Analytics cookies help us improve our application by collecting and reporting info on how you use it. They collect information in a way that does not directly identify anyone.";
      case 'Personalization':
        return "Personalisation cookies collect information about your use of this app in order to display contect and experience that are relevant to you.";
      case 'Marketing':
        return "Marketing cookies collect information about your use of this and other apps to enable display ads and other marketing that is more relevant to you.";
      case 'Social media cookies':
        return "These cookies are set by a range of social media services that we have added to the site to enable you to share our content with your friends and networks.";
      default:
        return '';
    }
  }
}
