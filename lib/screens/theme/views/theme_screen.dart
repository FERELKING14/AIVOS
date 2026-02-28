import 'package:flutter/material.dart';
import 'package:aivo/theme/theme_provider.dart';
import 'package:aivo/constants.dart';
import 'package:aivo/generated_l10n/app_localizations.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  late ThemeProvider _themeProvider;

  @override
  void initState() {
    super.initState();
    _themeProvider = ThemeProvider();
    _themeProvider.addListener(_rebuild);
  }

  @override
  void dispose() {
    _themeProvider.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final current = _themeProvider.themeMode;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.theme)),
      body: ListView(
        padding: const EdgeInsets.all(defaultPadding),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(l10n.themeMode, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          ),
          _ThemeOption(icon: Icons.wb_sunny, label: l10n.lightTheme, selected: current == ThemeMode.light, onTap: () => _themeProvider.setThemeMode(ThemeMode.light)),
          const SizedBox(height: 8),
          _ThemeOption(icon: Icons.nightlight_round, label: l10n.darkTheme, selected: current == ThemeMode.dark, onTap: () => _themeProvider.setThemeMode(ThemeMode.dark)),
          const SizedBox(height: 8),
          _ThemeOption(icon: Icons.brightness_auto, label: l10n.systemTheme, selected: current == ThemeMode.system, onTap: () => _themeProvider.setThemeMode(ThemeMode.system)),
          const Divider(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(l10n.themeAccent, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          ),
          GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _ColorOption(Color(0xFF7B61FF), 'Purple', _themeProvider.accent == ThemeAccent.purple, ()=> _themeProvider.setAccent(ThemeAccent.purple)),
              _ColorOption(Color(0xFF1F7EFF), 'Sky', _themeProvider.accent == ThemeAccent.blue, () => _themeProvider.setAccent(ThemeAccent.blue)),
              _ColorOption(Color(0xFF00B366), 'Forest', _themeProvider.accent == ThemeAccent.green, () => _themeProvider.setAccent(ThemeAccent.green)),
              _ColorOption(Color(0xFFFF9800), 'Orange', _themeProvider.accent == ThemeAccent.orange, () => _themeProvider.setAccent(ThemeAccent.orange)),
              _ColorOption(Color(0xFFFF4444), 'Coral', _themeProvider.accent == ThemeAccent.red, () => _themeProvider.setAccent(ThemeAccent.red)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ThemeOption({required this.icon, required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) => ListTile(
    leading: Icon(icon, color: selected ? primaryColor : null, size: 28),
    title: Text(label, style: TextStyle(fontWeight: selected ? FontWeight.bold : FontWeight.normal)),
    trailing: selected ? const Icon(Icons.check_circle, color: primaryColor) : null,
    tileColor: selected ? primaryColor.withValues(alpha: 0.08) : null,
    onTap: onTap,
  );
}

class _ColorOption extends StatelessWidget {
  final Color color;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ColorOption(this.color, this.label, this.selected, this.onTap);

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: selected ? color : Colors.grey.withValues(alpha: 0.3), width: selected ? 3 : 1),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(width: 48, height: 48, decoration: BoxDecoration(shape: BoxShape.circle, color: color, border: selected ? Border.all(color: Colors.white, width: 3) : null), child: selected ? const Icon(Icons.check, color: Colors.white) : null),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12, fontWeight: selected ? FontWeight.bold : FontWeight.normal), textAlign: TextAlign.center),
      ]),
    ),
  );
}
