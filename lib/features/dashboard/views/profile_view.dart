import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/widgets/back_button.dart';
import 'package:fruits_app/features/auth/widgets/phone_number_drop_down_button.dart';
import 'package:fruits_app/features/auth/widgets/required_mark_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/profile_avatar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const AppBackButton()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile picture placeholder
            ProfileAvatar(
              circularBorderColor: AppColors.primaryColor,
              name: "zyad",
              avatarTopPositionedWidget: Positioned(
                bottom: -12.0,
                right: -12.0,
                child: Icon(
                  Icons.add_a_photo_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Full Name Field
            const RequiredMarkWidget(text: AppStrings.fullName),
            TextField(
              decoration: const InputDecoration(
                hintText: AppStrings.firstAndLastName,
              ),
            ),

            const SizedBox(height: 18),

            // Phone Number Label
            const RequiredMarkWidget(text: AppStrings.phoneNumberWithWhatsapp),
            TextFormField(
              decoration: InputDecoration(
                hintText: AppStrings.phoneNumber,
                prefixIcon: const PhoneNumberFieldDropDownButton(),
              ),
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 18),

            // Password Label
            const RequiredMarkWidget(text: AppStrings.password),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(hintText: AppStrings.password),
            ),

            const SizedBox(height: 32),

            // Update Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(AppStrings.update),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
