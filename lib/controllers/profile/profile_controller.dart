import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flyn/resources/app_strings.dart';
import 'package:my_flyn/routes/app_routes.dart';

class ProfileController extends GetxController {
  // Profile fields
  final email = 'johndoe@example.com'.obs;
  final phone = '123-456-7890'.obs;
  final nickname = 'JohnDoe'.obs;
  final instagram = 'johndoe_ig'.obs;
  final website = 'https://www.example.com/'.obs;
  final portfolio = 'portfolio.pdf'.obs;

  // Password form (reactive)
  final currentPassword = ''.obs;
  final newPassword = ''.obs;
  final confirmPassword = ''.obs;

  // Optional UI flags
  final isSaving = false.obs;

  // Shared text controllers
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController nickNameController;
  late final TextEditingController instagramController;
  late final TextEditingController websiteController;
  late final TextEditingController portfolioController;

  // Password text controllers
  late final TextEditingController currentController;
  late final TextEditingController newController;
  late final TextEditingController confirmController;

  // Reactive validity for password form
  bool get canSubmitPassword =>
      currentPassword.value.isNotEmpty &&
      newPassword.value.isNotEmpty &&
      newPassword.value.length >= 8 &&
      newPassword.value == confirmPassword.value;

  @override
  void onInit() {
    super.onInit();

    // ---------- Profile Basic Info controllers ----------
    emailController = TextEditingController(text: email.value)
      ..addListener(() => email.value = emailController.text);
    phoneController = TextEditingController(text: phone.value)
      ..addListener(() => phone.value = phoneController.text);
    nickNameController = TextEditingController(text: nickname.value)
      ..addListener(() => nickname.value = nickNameController.text);
    instagramController = TextEditingController(text: instagram.value)
      ..addListener(() => instagram.value = instagramController.text);
    websiteController = TextEditingController(text: website.value)
      ..addListener(() => website.value = websiteController.text);
    portfolioController = TextEditingController(text: portfolio.value)
      ..addListener(() => portfolio.value = portfolioController.text);

    // ---------- Password settings field controllers ----------
    currentController = TextEditingController(text: currentPassword.value)
      ..addListener(() => currentPassword.value = currentController.text);
    newController = TextEditingController(text: newPassword.value)
      ..addListener(() => newPassword.value = newController.text);
    confirmController = TextEditingController(text: confirmPassword.value)
      ..addListener(() => confirmPassword.value = confirmController.text);
  }

  @override
  void onClose() {
    // Dispose all controllers
    emailController.dispose();
    phoneController.dispose();
    nickNameController.dispose();
    instagramController.dispose();
    websiteController.dispose();
    portfolioController.dispose();
    currentController.dispose();
    newController.dispose();
    confirmController.dispose();
    super.onClose();
  }

  // Save Profile Basic Info
  void saveBasicInfo() {
    Get.snackbar(AppStrings.savedTitle, AppStrings.basicInfoSavedMsg);
  }

  // Update Password
  Future<void> updatePassword() async {
    if (!canSubmitPassword) return;

    try {
      isSaving.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 600));

      Get.snackbar(AppStrings.successTitle, AppStrings.passwordUpdatedMsg);

      // Clear password fields after success
      currentPassword.value = '';
      newPassword.value = '';
      confirmPassword.value = '';
      currentController.clear();
      newController.clear();
      confirmController.clear();
      Get.toNamed(
        AppRoutes.home,
      ); // Move to the home page after successfully updating the password
    } finally {
      isSaving.value = false;
    }
  }
}
