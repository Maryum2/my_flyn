import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flyn/controllers/permissions/permissions_controller.dart';
import 'package:my_flyn/models/compaign_status.dart';
import 'package:my_flyn/resources/app_colors.dart';
import 'package:my_flyn/resources/app_strings.dart';
import 'package:my_flyn/resources/app_text_styles.dart';
import 'package:my_flyn/routes/app_routes.dart';
import 'package:my_flyn/views/home/circle_camera_button.dart';
import 'package:my_flyn/views/home/my_compaigns_status_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final perm = Get.put(PermissionController());

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          children: [
            // Greeting row with circular camera button
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.hello,
                        style: AppTextStyles.bodyLarge.copyWith(fontSize: 20),
                      ),
                      Text(
                        AppStrings.userName,
                        style: AppTextStyles.headlineMedium,
                      ),
                    ],
                  ),
                ),
                // Circular camera button
                Obx(
                  () => CircleCameraButton(
                    label: AppStrings.registerImage,
                    onTap: perm.isChecking.value
                        ? null
                        : () => perm.requestCamera(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            MyCampaignStatusCard(
              onTap: () => Get.toNamed(AppRoutes.campaigns),
              items: const [
                StatusItem(label: AppStrings.statusApplied, count: 0),
                StatusItem(label: AppStrings.statusInProgress, count: 0),
                StatusItem(label: AppStrings.statusCompleted, count: 0),
              ],
            ),
            const SizedBox(height: 40),

            // Menu list
            _MenuTile(
              icon: 'assets/icons/user.png',
              title: AppStrings.myInfo,
              onTap: () => Get.toNamed(AppRoutes.myInfo),
            ),
            _DividerThin(),
            _MenuTile(
              icon: 'assets/icons/note.png',
              title: AppStrings.notice,
              onTap: () => Get.toNamed(AppRoutes.notice),
            ),
            _DividerThin(),
            _MenuTile(
              icon: 'assets/icons/inquiry.png',
              title: AppStrings.inquiry,
              onTap: () => Get.toNamed(AppRoutes.inquiry),
            ),
            _DividerThin(),
            _MenuTile(
              icon: 'assets/icons/faq.png',
              title: AppStrings.faq,
              onTap: () => Get.toNamed(AppRoutes.faq),
            ),
            _DividerThin(),
            _MenuTile(
              icon: 'assets/icons/terms_and_policies.png',
              title: AppStrings.terms,
              onTap: () => Get.toNamed(AppRoutes.terms),
            ),
            _DividerThin(),
            _MenuTile(
              icon: 'assets/icons/logout.png',
              title: AppStrings.logout,
              onTap: () {},
            ),
            _DividerThin(),
            _MenuTile(
              icon: 'assets/icons/delete_account.png',
              title: AppStrings.deleteAccount,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  const _MenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: Image.asset(
        icon,
        color: AppColors.textPrimary,
        height: 20,
        width: 20,
      ),
      title: Text(title, style: AppTextStyles.bodyLarge.copyWith(fontSize: 14)),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColors.textPrimary,
        size: 20,
      ),
      onTap: onTap,
    );
  }
}

class _DividerThin extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      const Divider(height: 1, color: AppColors.divider);
}
