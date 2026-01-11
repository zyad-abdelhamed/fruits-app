import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/views_routes_constants.dart';
import 'package:fruits_app/features/dashboard/views/profile_view.dart';

class SettingsOptions {
  final List<Widget> items;

  factory SettingsOptions(BuildContext context) {
    return SettingsOptions._internal(_buildItems(context));
  }

  SettingsOptions._internal(this.items);

  static List<Widget> _buildItems(BuildContext context) {
    return List.generate(
      _optionsIcons.length,
      (int i) => ListTile(
        leading: Icon(_optionsIcons[i]),
        title: Text(AppStrings.settingsOptionsTitles[i]),
        trailing: const Icon(Icons.chevron_right),
        onTap: _getMenuActions(context)[i],
      ),
    );
  }

  static List<IconData> get _optionsIcons => const [
    Icons.person_outline,
    Icons.receipt_long,
    Icons.favorite_border,
    Icons.language,
    Icons.headset_mic,
    Icons.description_outlined,
    Icons.info_outline,
  ];

  static List<VoidCallback> _getMenuActions(BuildContext context) {
    return [
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProfileView()),
        );
      },
      () {
        print("My Orders tapped");
      },
      () {
        print("Favorite tapped");
      },
      () {
        print("Language tapped");
      },
      () {
        print("Support tapped");
      },
      () {
        Navigator.pushNamed(
          context,
          ViewsRoutesConstants.termsAndConditionsView,
        );
      },
      () {
        Navigator.pushNamed(context, ViewsRoutesConstants.contactUsView);
      },
    ];
  }
}
