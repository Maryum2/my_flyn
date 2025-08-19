import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flyn/resources/app_colors.dart';
import 'package:my_flyn/resources/app_strings.dart';
import 'package:my_flyn/resources/app_text_styles.dart';
import 'package:my_flyn/routes/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 900), () {
      Get.offAllNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Text(
            AppStrings.splashTitle,
            style: AppTextStyles.displaySmall.copyWith(
              color: AppColors.background,
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
