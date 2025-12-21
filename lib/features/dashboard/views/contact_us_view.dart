import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/constants_values.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/core/widgets/back_button.dart';
import 'package:fruits_app/features/auth/widgets/required_mark_widget.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(AppStrings.contactUs),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              // Name Field
              const RequiredMarkWidget(text: "Name", isRequired: false),
              TextField(),

              const SizedBox(height: 20),

              // Mobile Field
              const RequiredMarkWidget(
                text: "Mobile Number",
                isRequired: false,
              ),
              TextField(),

              const SizedBox(height: 20),

              // Message Field
              const RequiredMarkWidget(text: "Message", isRequired: false),
              TextField(maxLines: 6),

              const SizedBox(height: 30),

              // Submit Button
              ElevatedButton(onPressed: () {}, child: Text(AppStrings.submit)),

              const SizedBox(height: 30),

              // Social Media Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SocialIcon(ImagesRoutesConstants.call),
                  const SizedBox(width: 20),
                  _SocialIcon(ImagesRoutesConstants.facebook),
                  const SizedBox(width: 20),
                  _SocialIcon(ImagesRoutesConstants.instagram),
                  const SizedBox(width: 20),
                  _SocialIcon(ImagesRoutesConstants.youtue),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon(this.image);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300, width: 2),
      ),
      child: Image.asset(
        image,
        height: ConstantsValues.iconDefaultSize,
        width: ConstantsValues.iconDefaultSize,
      ),
    );
  }
}
