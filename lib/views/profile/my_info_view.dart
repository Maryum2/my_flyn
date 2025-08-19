import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flyn/core/components/common_app_bar.dart';
import 'package:my_flyn/resources/app_colors.dart';
import 'package:my_flyn/resources/app_strings.dart';
import 'package:my_flyn/resources/app_text_styles.dart';
import 'package:my_flyn/routes/app_routes.dart';

class MyInfoView extends StatelessWidget {
  const MyInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: AppStrings.myInfoTitle),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        children: [
          _navTile(
            AppStrings.basicInfoTitle,
            onTap: () => Get.toNamed(AppRoutes.basicInfo),
          ),
          const Divider(height: 1, color: AppColors.lightGray),
          _navTile(
            AppStrings.passwordSettingsTitle,
            onTap: () => Get.toNamed(AppRoutes.password),
          ),
          const Divider(height: 1, color: AppColors.lightGray),
          _navTile(
            AppStrings.interestCategory,
            onTap: () => Get.toNamed(AppRoutes.interests),
          ),
          const Divider(height: 1, color: AppColors.lightGray),
        ],
      ),
    );
  }

  Widget _navTile(String title, {required VoidCallback onTap}) => ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
    title: Text(
      title,
      style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
    ),
    trailing: const Icon(Icons.chevron_right, size: 20),
    onTap: onTap,
  );
}
