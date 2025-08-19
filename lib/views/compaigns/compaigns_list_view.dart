import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flyn/controllers/compaigns/compaign_controller.dart';
import 'package:my_flyn/core/components/common_app_bar.dart';
import 'package:my_flyn/resources/app_colors.dart';
import 'package:my_flyn/resources/app_strings.dart';
import 'package:my_flyn/resources/app_text_styles.dart';

class CampaignListView extends StatelessWidget {
  const CampaignListView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(CampaignController());
    return Scaffold(
      appBar: const CommonAppBar(title: AppStrings.campaignMatching),
      body: Stack(
        children: [
          // main content
          Column(
            children: [
              _TabStrip(controller: c),
              const Divider(height: 1, color: AppColors.divider),
              Expanded(
                child: Obx(
                  () => ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 34,
                    ),
                    itemCount: c.campaigns.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 20),
                    itemBuilder: (_, i) => _CampaignRow(
                      title: c.campaigns[i].title,
                      subtitle: AppStrings.campaignSubtitle,
                      thumbUrl: c.campaigns[i].thumbnailUrl,
                      chips: const [
                        AppStrings.tagFB,
                        AppStrings.tagFashion,
                        AppStrings.tagKids,
                        AppStrings.tagLiving,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // bottom gradient overlay
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 50,
            child: IgnorePointer(
              ignoring: true,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppColors.lightGray.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabStrip extends StatelessWidget {
  final CampaignController controller;
  const _TabStrip({required this.controller});

  @override
  Widget build(BuildContext context) {
    final labels = const [
      AppStrings.statusApplied,
      AppStrings.statusInProgress,
      AppStrings.statusCompleted,
    ];

    return Obx(() {
      final index = controller.currentTab.value;
      return Column(
        children: [
          Row(
            children: List.generate(3, (i) {
              final isActive = index == i;
              return Expanded(
                child: InkWell(
                  onTap: () => controller.setTab(i),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        labels[i],
                        style: AppTextStyles.titleMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isActive
                              ? AppColors.textPrimary
                              : AppColors.unselected,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          Row(
            children: List.generate(3, (i) {
              final isActive = index == i;
              return Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 3,
                  color: isActive ? AppColors.primary : Colors.transparent,
                ),
              );
            }),
          ),
        ],
      );
    });
  }
}

class _CampaignRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String thumbUrl;
  final List<String> chips;

  const _CampaignRow({
    required this.title,
    required this.subtitle,
    required this.thumbUrl,
    required this.chips,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              thumbUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + subtitle
                Text(
                  title,
                  style: AppTextStyles.titleSmall.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 28),
                if (chips.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: chips
                        .map(
                          (e) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              e,
                              style: AppTextStyles.labelMedium.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
