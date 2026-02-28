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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.theme)),
      body: ListView(
        padding: const EdgeInsets.all(defaultPadding),
        children: [
          // Theme Mode Selection
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              l10n.themeMode,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          _buildThemeModeSelector(l10n),
          const SizedBox(height: 32),

          // Accent Color Selection
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              l10n.themeAccent,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          _buildThemeCards(),
          const SizedBox(height: 32),

          // Color Palette
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Color Options',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          _buildColorPalette(),
        ],
      ),
    );
  }

  Widget _buildThemeModeSelector(AppLocalizations l10n) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _ThemeModeButton(
            label: l10n.systemTheme,
            selected: _themeProvider.themeMode == ThemeMode.system,
            onTap: () => _themeProvider.setThemeMode(ThemeMode.system),
          ),
          _ThemeModeButton(
            label: l10n.lightTheme,
            selected: _themeProvider.themeMode == ThemeMode.light,
            onTap: () => _themeProvider.setThemeMode(ThemeMode.light),
          ),
          _ThemeModeButton(
            label: l10n.darkTheme,
            selected: _themeProvider.themeMode == ThemeMode.dark,
            onTap: () => _themeProvider.setThemeMode(ThemeMode.dark),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeCards() {
    final themes = [
      ('Purple', ThemeAccent.purple, const Color(0xFF7B61FF)),
      ('Sky Blue', ThemeAccent.blue, const Color(0xFF1F7EFF)),
      ('Forest', ThemeAccent.green, const Color(0xFF00B366)),
      ('Orange', ThemeAccent.orange, const Color(0xFFFF9800)),
      ('Coral', ThemeAccent.red, const Color(0xFFFF4444)),
    ];

    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: themes
          .map((theme) => _ThemePreviewCard(
                name: theme.$1,
                accent: theme.$3,
                selected: _themeProvider.accent == theme.$2,
                onTap: () => _themeProvider.setAccent(theme.$2),
              ))
          .toList(),
    );
  }

  Widget _buildColorPalette() {
    final colors = [
      const Color(0xFF7B61FF), // Purple
      const Color(0xFF1F7EFF), // Blue
      const Color(0xFF00B366), // Green
      const Color(0xFFFF9800), // Orange
      const Color(0xFFFF4444), // Red
      const Color(0xFFE91E63), // Pink
      const Color(0xFF00BCD4), // Cyan
      const Color(0xFF8BC34A), // Lime
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: colors
          .map((color) => _ColorButton(
                color: color,
                onTap: () {
                  // Future: allow custom color selection
                },
              ))
          .toList(),
    );
  }
}

class _ThemeModeButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ThemeModeButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? primaryColor.withValues(alpha: 0.15) : null,
          border: selected
              ? Border(
                  bottom: BorderSide(color: primaryColor, width: 2),
                )
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            color: selected ? primaryColor : null,
          ),
        ),
      ),
    ),
  );
}

class _ThemePreviewCard extends StatelessWidget {
  final String name;
  final Color accent;
  final bool selected;
  final VoidCallback onTap;

  const _ThemePreviewCard({
    required this.name,
    required this.accent,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selected ? accent : Colors.grey.withValues(alpha: 0.3),
          width: selected ? 2 : 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Theme preview representation
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[800]
                  : Colors.grey[200],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Preview elements
                Positioned(
                  top: 6,
                  left: 6,
                  right: 6,
                  child: Container(
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: accent,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 6,
                  left: 6,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: accent,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: accent.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                if (selected)
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: accent, width: 2),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;

  const _ColorButton({
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
    ),
  );
}
