import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(AppStrings.appName),
      leading: SizedBox.shrink(),
      centerTitle: false,
      shape: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        InkWell(
          onTap: () {},
          child: Image.asset(
            ImagesRoutesConstants.edit,
            height: 24.0,
            width: 24.0,
          ),
        ),
      ],
    );
  }
}
