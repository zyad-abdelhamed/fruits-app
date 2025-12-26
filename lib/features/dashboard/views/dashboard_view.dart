import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/features/dashboard/widgets/cart_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/custom_bottom_nav_bar.dart';
import 'package:fruits_app/features/dashboard/widgets/favorites_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/home_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/more_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/orders_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  List<IconData> get navIcons => const <IconData>[
    Icons.home,
    Icons.list,
    Icons.shopping_cart,
    Icons.favorite,
    Icons.more_vert,
  ];

  List<StatelessWidget> get pages => const <StatelessWidget>[
    HomeWidget(),
    OrdersWidget(),
    CartWidget(),
    FavoritesWidget(),
    MoreWidget(),
  ];

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late final ValueNotifier<int> currentIndexNotifier;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    currentIndexNotifier = ValueNotifier<int>(0);
    _pageController = PageController();
  }

  @override
  void dispose() {
    currentIndexNotifier.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView(controller: _pageController, children: widget.pages),
      ),

      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: currentIndexNotifier,
        builder: (_, int currentIndex, __) {
          return CustomBottomNavBar(
            items: List.generate(
              widget.navIcons.length,
              (int i) => BottomNavigationBarItem(
                icon: Icon(widget.navIcons[i]),
                label: AppStrings.navLabels[i],
              ),
            ),
            currentIndex: currentIndex,
            onTap: _updatePage,
          );
        },
      ),
    );
  }

  void _updatePage(int value) {
    currentIndexNotifier.value = value;
  }
}
