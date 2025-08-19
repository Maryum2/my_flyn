import 'package:get/get.dart';
import 'package:my_flyn/views/basic_info/basic_info_view.dart';
import 'package:my_flyn/views/compaigns/compaigns_list_view.dart';
import 'package:my_flyn/views/home/home_view.dart';
import 'package:my_flyn/views/misc/placeholder_view.dart';
import 'package:my_flyn/views/password_settings/password_settings_view.dart';
import 'package:my_flyn/views/profile/my_info_view.dart';
import 'package:my_flyn/views/splash/splash_view.dart';

class AppRoutes {
  static const splash = '/';
  static const home = '/home';

  // Campaign
  static const campaigns = '/campaigns';

  // Profile
  static const myInfo = '/my-info';
  static const basicInfo = '/basic-info';
  static const password = '/password';

  // Misc (using placeholders for now)
  static const notice = '/notice';
  static const faq = '/faq';
  static const terms = '/terms';
  static const inquiry = '/inquiry';
  static const interests = '/interests';
}

class AppPages {
  static final pages = <GetPage>[
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(name: AppRoutes.home, page: () => const HomeView()),
    GetPage(name: AppRoutes.campaigns, page: () => const CampaignListView()),

    // Profile
    GetPage(name: AppRoutes.myInfo, page: () => const MyInfoView()),
    GetPage(name: AppRoutes.basicInfo, page: () => const BasicInfoView()),
    GetPage(name: AppRoutes.password, page: () => const PasswordSettingsView()),

    // Misc → placeholder
    GetPage(
      name: AppRoutes.notice,
      page: () => const PlaceholderView(title: 'Notice'),
    ),
    GetPage(
      name: AppRoutes.inquiry,
      page: () => const PlaceholderView(title: 'Inquiry'),
    ),
    GetPage(
      name: AppRoutes.faq,
      page: () => const PlaceholderView(title: 'FAQ'),
    ),
    GetPage(
      name: AppRoutes.terms,
      page: () => const PlaceholderView(title: 'Terms and Policies'),
    ),
    GetPage(
      name: AppRoutes.interests,
      page: () => const PlaceholderView(title: 'Interests'),
    ),
  ];
}
