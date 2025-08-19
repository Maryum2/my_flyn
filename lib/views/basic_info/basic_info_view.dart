// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:my_flyn/controllers/profile/profile_controller.dart';
// import 'package:my_flyn/core/components/common_app_bar.dart';
// import 'package:my_flyn/core/components/common_text_field.dart';
// import 'package:my_flyn/core/components/primary_button.dart';
// import 'package:my_flyn/resources/app_colors.dart';
// import 'package:my_flyn/resources/app_strings.dart';

// class BasicInfoView extends StatelessWidget {
//   const BasicInfoView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final c = Get.put(ProfileController());

//     final idController = TextEditingController(text: AppStrings.userId);
//     final emailController = TextEditingController(text: c.email.value);
//     final phoneController = TextEditingController(text: c.phone.value);
//     final nickNameController = TextEditingController(text: c.nickname.value);
//     final instagramController = TextEditingController(text: c.instagram.value);
//     final webController = TextEditingController(text: c.website.value);
//     final portfolioController = TextEditingController(text: c.portfolio.value);

//     return Scaffold(
//       appBar: const CommonAppBar(title: AppStrings.basicInfoTitle),
//       body: ListView(
//         padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
//         children: [
//           CommonTextField(
//             label: AppStrings.userIdLabel,
//             hint: '',
//             controller: idController,
//             enabled: false,
//           ),
//           const SizedBox(height: 16),

//           CommonTextField(
//             label: AppStrings.email,
//             hint: AppStrings.emailHint,
//             controller: emailController,
//             keyboardType: TextInputType.emailAddress,
//           ),
//           const SizedBox(height: 16),

//           Row(
//             children: [
//               Expanded(
//                 child: CommonTextField(
//                   label: AppStrings.phone,
//                   hint: AppStrings.phoneHint,
//                   controller: phoneController,
//                   keyboardType: TextInputType.phone,
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Column(
//                 children: [
//                   const SizedBox(height: 25),
//                   PrimaryButton(label: AppStrings.change, onPressed: () {}),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),

//           CommonTextField(
//             label: AppStrings.nickname,
//             hint: AppStrings.nicknameHint,
//             controller: nickNameController,
//           ),
//           const SizedBox(height: 16),

//           CommonTextField(
//             label: AppStrings.instagramId,
//             hint: AppStrings.instagramHint,
//             controller: instagramController,
//           ),
//           const SizedBox(height: 16),

//           CommonTextField(
//             label: AppStrings.representativeLink,
//             hint: AppStrings.representativeLinkHint,
//             controller: webController,
//             keyboardType: TextInputType.url,
//           ),
//           const SizedBox(height: 16),
//           CommonTextField(
//             label: AppStrings.portfolio,
//             hint: AppStrings.portfolioHint,
//             controller: portfolioController,
//             suffixIcon: const Icon(
//               Icons.attach_file,
//               color: AppColors.textSecondary,
//             ),
//           ),
//           const SizedBox(height: 24),

//           PrimaryButton(
//             label: AppStrings.save,
//             onPressed: () {
//               c.email.value = emailController.text;
//               c.phone.value = phoneController.text;
//               c.nickname.value = nickNameController.text;
//               c.instagram.value = instagramController.text;
//               c.website.value = webController.text;
//               c.portfolio.value = portfolioController.text;
//               c.saveBasicInfo();
//             },
//             filled: true,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flyn/controllers/profile/profile_controller.dart';
import 'package:my_flyn/core/components/common_app_bar.dart';
import 'package:my_flyn/core/components/common_text_field.dart';
import 'package:my_flyn/core/components/primary_button.dart';
import 'package:my_flyn/resources/app_colors.dart';
import 'package:my_flyn/resources/app_strings.dart';
import 'package:my_flyn/resources/app_text_styles.dart';

/// Basic Info screen
/// - Uses shared TextEditingControllers from ProfileController
/// - Saves via controller.saveBasicInfo()
class BasicInfoView extends GetView<ProfileController> {
  const BasicInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = controller;

    return Scaffold(
      appBar: const CommonAppBar(title: AppStrings.basicInfoTitle),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
        children: [
          // User ID (disabled / filled)
          CommonTextField(
            label: AppStrings.userIdLabel,
            hint: '',
            controller: TextEditingController(text: AppStrings.userId),
            enabled: false,
          ),
          const SizedBox(height: 16),

          CommonTextField(
            label: AppStrings.email,
            hint: AppStrings.emailHint,
            controller: c.emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),

          // Phone with Change button aligned to the input (label above both)
          Text(
            AppStrings.phone,
            style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: CommonTextField(
                  label: AppStrings.phone, // hidden inside field
                  hint: AppStrings.phoneHint,
                  controller: c.phoneController,
                  keyboardType: TextInputType.phone,
                  showLabel: false,
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 48,
                child: PrimaryButton(
                  label: AppStrings.change,
                  onPressed: () {
                    
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          CommonTextField(
            label: AppStrings.nickname,
            hint: AppStrings.nicknameHint,
            controller: c.nickNameController,
          ),
          const SizedBox(height: 16),

          CommonTextField(
            label: AppStrings.instagramId,
            hint: AppStrings.instagramHint,
            controller: c.instagramController,
          ),
          const SizedBox(height: 16),

          CommonTextField(
            label: AppStrings.representativeLink,
            hint: AppStrings.representativeLinkHint,
            controller: c.websiteController,
            keyboardType: TextInputType.url,
          ),
          const SizedBox(height: 16),

          CommonTextField(
            label: AppStrings.portfolio,
            hint: AppStrings.portfolioHint,
            controller: c.portfolioController,
            suffixIcon: const Icon(
              Icons.attach_file,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),

          PrimaryButton(
            label: AppStrings.save,
            onPressed: c.saveBasicInfo,
            filled: true,
          ),
        ],
      ),
    );
  }
}
