import 'package:flutter/material.dart';
import 'package:my_flyn/resources/app_colors.dart';
import 'package:my_flyn/resources/app_text_styles.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;

  const CommonAppBar({super.key, required this.title, this.onBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      scrolledUnderElevation: 0.0,
      automaticallyImplyLeading: false,
      elevation: 0,
      toolbarHeight: 80,
      titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              size: 15,
              Icons.arrow_back_ios_new,
              color: AppColors.textPrimary,
            ),
            onPressed: onBack ?? () => Navigator.of(context).pop(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(title, style: AppTextStyles.headlineMedium),
          ),
        ],
      ),
    );
  }

  // Required for PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(90);
}
