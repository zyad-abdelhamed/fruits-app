import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/features/dashboard/widgets/profile_avatar.dart';
import 'package:fruits_app/features/dashboard/widgets/setteings_options_list_view.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // app bar
          AppBar(
            leading: const BackButton(),
            title: Text(AppStrings.fruitsMarket),
          ),

          const SizedBox(height: 32.0),

          // profile avatar
          ProfileAvatar(
            circularBorderColor: Colors.grey.shade400,
            name: AppStrings.fruitsMarket,
            avatarTopPositionedWidget: const Center(
              child: Icon(Icons.person_outline, size: 40, color: Colors.grey),
            ),
          ),

          const SizedBox(height: 48.0),

          // options
          ...SettingsOptions(context).items,
        ],
      ),
    );
  }
}
