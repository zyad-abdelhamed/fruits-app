import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/features/dashboard/widgets/profile_avatar.dart';
import 'package:fruits_app/features/dashboard/widgets/setteings_options_list_view.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // app bar
        AppBar(
          leading: const BackButton(),
          title: Text(AppStrings.fruitsMarket),
        ),

        const SizedBox(height: 32.0),

        // profile avatar
        const ProfileAvatar(),

        const SizedBox(height: 16.0),

        // welcome text
        Text(
          "${AppStrings.welcome}, ${AppStrings.fruitsMarket}",
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        const SizedBox(height: 48.0),

        // options
        const SettingsOptionsListView(),
      ],
    );
  }
}
