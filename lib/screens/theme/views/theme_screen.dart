
import 'package:flutter/material.dart';
import 'package:aivo/theme/theme_provider.dart';
import 'package:aivo/constants.dart';


class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  ThemeProvider? _themeProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Accès au ThemeProvider via le widget racine
    _themeProvider = ThemeProvider();
  }

  @override
  Widget build(BuildContext context) {
    final current = _themeProvider?.themeMode ?? ThemeMode.system;
    return Scaffold(
      appBar: AppBar(title: const Text('Thème')),
      body: ListView(
        padding: const EdgeInsets.all(defaultPadding),
        children: [
          _ThemeOption(
            icon: Icons.wb_sunny,
            label: 'Clair',
            selected: current == ThemeMode.light,
            onTap: () => _themeProvider?.setThemeMode(ThemeMode.light),
          ),
          const SizedBox(height: 16),
          _ThemeOption(
            icon: Icons.nightlight_round,
            label: 'Sombre',
            selected: current == ThemeMode.dark,
            onTap: () => _themeProvider?.setThemeMode(ThemeMode.dark),
          ),
          const SizedBox(height: 16),
          _ThemeOption(
            icon: Icons.brightness_auto,
            label: 'Système',
            selected: current == ThemeMode.system,
            onTap: () => _themeProvider?.setThemeMode(ThemeMode.system),
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

  const _ThemeOption({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: selected ? primaryColor : null, size: 32),
      title: Text(label, style: TextStyle(fontWeight: selected ? FontWeight.bold : null)),
      trailing: selected ? const Icon(Icons.check_circle, color: primaryColor) : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: selected ? primaryColor.withOpacity(0.08) : null,
      onTap: onTap,
    );
  }
}
