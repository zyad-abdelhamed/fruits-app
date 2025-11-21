import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/constants_values.dart';
import 'package:fruits_app/features/dashboard/widgets/baners_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/categories_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/home_app_bar.dart';
import 'package:fruits_app/features/dashboard/widgets/sellers_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // AppBar,
        const HomeAppBar(),

        // spacing
        const SliverToBoxAdapter(
          child: SizedBox(height: ConstantsValues.dashBoardColumnSpacing),
        ),

        // baners
        const SliverToBoxAdapter(child: BanersWidget()),

        // spacing
        const SliverToBoxAdapter(
          child: SizedBox(height: ConstantsValues.dashBoardColumnSpacing),
        ),

        // categories
        const SliverToBoxAdapter(child: CategoriesWidget()),

        // spacing
        const SliverToBoxAdapter(
          child: SizedBox(height: ConstantsValues.dashBoardColumnSpacing),
        ),

        // sellers
        const SellersWidget(),
      ],
    );
  }
}
