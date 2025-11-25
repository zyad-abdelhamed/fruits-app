import 'package:flutter/material.dart';
import 'package:fruits_app/features/dashboard/widgets/cart_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/custom_bottom_nav_bar.dart';
import 'package:fruits_app/features/dashboard/widgets/home_widget.dart';
import 'package:fruits_app/features/dashboard/widgets/orders_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late final ValueNotifier<int> currentIndexNotifier;
  late final PageController _PageController;

  @override
  void initState() {
    super.initState();
    currentIndexNotifier = ValueNotifier<int>(0);
    _PageController = PageController();
  }

  @override
  void dispose() {
    currentIndexNotifier.dispose();
    _PageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView(
          controller: _PageController,
          children: const [
            HomeWidget(),
            OrdersWidget(),
            CartWidget(),
            Center(child: Text('Favorite')),
            Center(child: Text('Profile')),
          ],
        ),
      ),

      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: currentIndexNotifier,
        builder: (context, int currentIndex, _) {
          return CustomBottomNavBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: currentIndex,
            onTap: _updatePage,
          );
        },
      ),
    );
  }

  void _updatePage(int value) {
    currentIndexNotifier.value = value;
    _PageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
