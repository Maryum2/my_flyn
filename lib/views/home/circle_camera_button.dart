import 'package:flutter/material.dart';
import 'package:my_flyn/resources/app_colors.dart';
import 'package:my_flyn/resources/app_text_styles.dart';

class CircleCameraButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const CircleCameraButton({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: 40,
      child: Container(
        width: 90,
        height: 90,
        decoration: const BoxDecoration(
          color: AppColors.myCompaignsCard,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/camera.png'),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
