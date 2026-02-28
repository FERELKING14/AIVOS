import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aivo/constants.dart';

class InfoFieldListTile extends StatelessWidget {
  const InfoFieldListTile({
    super.key,
    required this.label,
    required this.value,
    this.onTap,
    this.isLink = false,
    this.svgIcon,
  });

  final String label;
  final String value;
  final VoidCallback? onTap;
  final bool isLink;
  final String? svgIcon;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // Icon
              if (svgIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SvgPicture.asset(
                    svgIcon!,
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                      isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              
              // Label
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDarkMode ? Colors.grey.shade600 : Colors.grey.shade500,
                  ),
                ),
              ),

              // Value
              GestureDetector(
                onTap: onTap,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isLink
                        ? primaryColor
                        : (isDarkMode ? Colors.white : Colors.black87),
                    decoration: isLink ? TextDecoration.underline : null,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
        ),
      ],
    );
  }
}
