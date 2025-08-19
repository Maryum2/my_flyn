import 'package:flutter/material.dart';
import 'package:my_flyn/models/compaigns.dart';
import 'package:my_flyn/resources/app_colors.dart';


class CommonCompaignCards extends StatelessWidget {
  final Campaign campaign;
  final VoidCallback onLike;

  const CommonCompaignCards({super.key, required this.campaign, required this.onLike});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: AspectRatio(
              aspectRatio: 335 / 100, // from Figma 335 × 100 header size
              child: Image.network(campaign.thumbnailUrl, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 6,
                  children: [
                    _chip(campaign.tag),
                    _chip('Review'),
                    _chip('후기작가'),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  campaign.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(.08),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(campaign.size, style: TextStyle(color: AppColors.primary)),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: onLike,
                      icon: Icon(campaign.liked ? Icons.favorite : Icons.favorite_border, color: AppColors.purpleLight),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(label, style: const TextStyle(fontSize: 12)),
      );
}