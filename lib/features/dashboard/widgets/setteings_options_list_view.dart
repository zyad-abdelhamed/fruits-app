import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';

class SettingsOptionsListView extends StatelessWidget {
  const SettingsOptionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: optionsIcons.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, int i) {
        return Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(8),
          child: ListTile(
            leading: Icon(optionsIcons[i]),
            title: Text(AppStrings.settingsOptionsTitles[i]),
            trailing: const Icon(Icons.chevron_right),
            onTap: getMenuActions(context)[i],
          ),
        );
      },
    );
  }

  List<IconData> get optionsIcons {
    return const [
      Icons.person_outline,
      Icons.receipt_long,
      Icons.favorite_border,
      Icons.language,
      Icons.headset_mic,
      Icons.description_outlined,
      Icons.info_outline,
    ];
  }

  List<VoidCallback> getMenuActions(BuildContext context) {
    return [
      () {
        // فتح صفحة الملف الشخصي
        // Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
        print("Profile tapped");
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
        print("Terms & Conditions tapped");
      },
      () {
        print("About Us tapped");
      },
    ];
  }
}
