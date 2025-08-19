// import 'package:flutter/material.dart';
// import 'package:my_flyn/resources/app_colors.dart';
// import 'package:my_flyn/resources/app_text_styles.dart';

// class CommonTextField extends StatelessWidget {
//   final String label;
//   final String hint;
//   final TextEditingController controller;
//   final TextInputType? keyboardType;
//   final bool obscure;
//   final bool required;

//   const CommonTextField({
//     super.key,
//     required this.label,
//     required this.hint,
//     required this.controller,
//     this.keyboardType,
//     this.obscure = false,
//     this.required = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(
//               label,
//               style: AppTextStyles.bodyMedium.copyWith(
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             if (required)
//               const Text(
//                 ' *',
//                 style: TextStyle(
//                   color: AppColors.error,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//           ],
//         ),
//         const SizedBox(height: 8),
//         TextField(
//           controller: controller,
//           keyboardType: keyboardType,
//           obscureText: obscure,
//           decoration: InputDecoration(
//             hintStyle: AppTextStyles.bodyMedium.copyWith(
//               color: AppColors.textSecondary,
//             ),
//             hintText: hint,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(
//                 color: AppColors.lightGray,
//                 width: 1,
//               ),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(color: AppColors.divider, width: 1),
//             ),
//             // Focused border
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(color: AppColors.primary, width: 2),
//             ),
//             // Error border (if you plan to use validator)
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: AppColors.error, width: 1.5),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: AppColors.error, width: 2),
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 12,
//               vertical: 14,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:my_flyn/resources/app_colors.dart';
import 'package:my_flyn/resources/app_text_styles.dart';

class CommonTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscure;
  final bool required;
  final bool enabled;             
  final bool readOnly;            
  final bool showLabel;            
  final Widget? suffixIcon;       
  final ValueChanged<String>? onChanged; 

  const CommonTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.obscure = false,
    this.required = false,
    this.enabled = true,
    this.readOnly = false,
    this.showLabel = true,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isReadonlyLike = !enabled || readOnly;

    final labelWidget = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        if (required)
          const Text(
            ' *',
            style: TextStyle(color: AppColors.error, fontSize: 14, fontWeight: FontWeight.w600),
          ),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) labelWidget,
        if (showLabel) const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscure,
          enabled: enabled,
          readOnly: readOnly,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            filled: isReadonlyLike,                           
            fillColor: const Color(0xFFF2F2F3),
            suffixIcon: suffixIcon,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.lightGray, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.divider, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.divider, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.error, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.error, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}

