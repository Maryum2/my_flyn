import 'package:flutter/material.dart';
import 'package:my_flyn/resources/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool filled;
  const PrimaryButton({super.key, required this.label, this.onPressed, this.filled = true});

  @override
  Widget build(BuildContext context) {
    final style = FilledButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );

    final outlineStyle = OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      side: BorderSide(color: AppColors.primary, width: 1.5),
      foregroundColor: AppColors.primary,
    );

    return filled
        ? FilledButton(
            style: style,
            onPressed: onPressed,
            child: Text(label),
          )
        : OutlinedButton(
            style: outlineStyle,
            onPressed: onPressed,
            child: Text(label),
          );
  }
}