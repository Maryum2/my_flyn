import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flyn/controllers/profile/profile_controller.dart';
import 'package:my_flyn/core/components/common_app_bar.dart';
import 'package:my_flyn/core/components/common_text_field.dart';
import 'package:my_flyn/core/components/primary_button.dart';
import 'package:my_flyn/resources/app_strings.dart';

class PasswordSettingsView extends StatelessWidget {
  const PasswordSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ProfileController());

    return Scaffold(
      appBar: const CommonAppBar(title: AppStrings.passwordSettingsTitle),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
        child: Column(
          children: [
            CommonTextField(
              label: AppStrings.currentPassword,
              hint: AppStrings.passwordHint,
              controller: c.currentController,
              obscure: true,
              required: true,
              // onChanged not required: listener already updates Rx
            ),
            const SizedBox(height: 24),
            CommonTextField(
              label: AppStrings.newPassword,
              hint: AppStrings.passwordHint,
              controller: c.newController,
              obscure: true,
              required: true,
            ),
            const SizedBox(height: 24),
            CommonTextField(
              label: AppStrings.confirmPassword,
              hint: AppStrings.passwordConfirmHint,
              controller: c.confirmController,
              obscure: true,
              required: true,
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(24),
        child: Obx(
          () => PrimaryButton(
            label: AppStrings.passwordDone,
            onPressed: c.canSubmitPassword ? c.updatePassword : null,
          ),
        ),
      ),
    );
  }
}
