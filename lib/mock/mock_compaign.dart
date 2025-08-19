import 'package:my_flyn/models/compaigns.dart';
import '../resources/app_strings.dart';

final List<Campaign> mockCampaigns = [
  Campaign(
    id: '1',
    title: AppStrings.campaignMatching,
    thumbnailUrl: 'assets/images/sea.png',
    tag: AppStrings.tagFood,
  ),
  Campaign(
    id: '2',
    title: 'Fashion Campaign',
    thumbnailUrl: 'assets/images/food.png',
    tag: AppStrings.tagFashion,
  ),
  Campaign(
    id: '3',
    title: 'Kids Campaign',
    thumbnailUrl: 'assets/images/camping.png',
    tag: AppStrings.tagKids,
  ),
  Campaign(
    id: '4',
    title: 'Living Campaign',
    thumbnailUrl: 'assets/images/friends.png',
    tag: AppStrings.tagLiving,
  ),
  Campaign(
    id: '5',
    title: 'Interior Campaign',
    thumbnailUrl: 'assets/images/more_food.png',
    tag: AppStrings.tagLiving,
  ),
];
