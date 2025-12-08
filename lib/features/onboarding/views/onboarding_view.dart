import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/constants/cache_constants.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/core/constants/views_routes_constants.dart';
import 'package:fruits_app/core/services/cache_service.dart';
import 'package:fruits_app/core/services/dependencey_injection_service.dart';
import 'package:fruits_app/core/utils/extentions/media_query_extention.dart';
import 'package:fruits_app/core/widgets/custom_dots_indicator.dart';
import 'package:fruits_app/features/onboarding/widgets/onboarding_page_view_item.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final ValueNotifier<int> _selectedIndexNotifier;
  late final PageController _pageController;
  late final BaseCacheService _cache;

  final int pageViewCount = 3;
  final double _spacing = 16.0;

  @override
  void initState() {
    super.initState();
    _selectedIndexNotifier = ValueNotifier<int>(1);
    _pageController = PageController();
    _cache = sl<BaseCacheService>();
  }

  @override
  void dispose() {
    markedOnoardingAsShown();

    _selectedIndexNotifier.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndexNotifier,
        builder: (BuildContext context, int selectedIndex, Widget? child) {
          final bool isFinished = (selectedIndex == pageViewCount);

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 8.0,
            ),
            child: Column(
              spacing: _spacing,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // skip button
                Align(
                  alignment: Alignment.topRight,
                  child: Visibility(
                    visible: !isFinished,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    maintainInteractivity: true,
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(Colors.grey),
                      ),
                      onPressed: () => goToNextPage(),
                      child: Text(
                        AppStrings.skip,
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ),
                // page view
                child!,
                // dots indicator
                CustomDotsIndicator(
                  count: pageViewCount,
                  selectedIndex: selectedIndex - 1,
                ),
                // next button
                ElevatedButton(
                  child: Text(
                    isFinished ? AppStrings.getStarted : AppStrings.next,
                  ),
                  onPressed: () => next(),
                ),
              ],
            ),
          );
        },
        child: SizedBox(
          height: context.isLandScape
              ? context.height * .8
              : context.width * .8,
          child: PageView(
            controller: _pageController,
            onPageChanged: (value) => _selectedIndexNotifier.value = value + 1,
            children: List.generate(
              pageViewCount,
              (int i) => OnboardingPageViewItem(
                image: ImagesRoutesConstants.onboarding,
                title: AppStrings.onboardingPageViewItems[i]['title']!,
                description:
                    AppStrings.onboardingPageViewItems[i]['description']!,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //   ===helper methods===
  next() {
    if (_selectedIndexNotifier.value == pageViewCount) {
      goToNextPage();
      return;
    }

    _pageController.animateToPage(
      _selectedIndexNotifier.value,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );

    _selectedIndexNotifier.value++;
  }

  goToNextPage() {
    Navigator.pushNamed(context, ViewsRoutesConstants.welcomeView);
  }

  void markedOnoardingAsShown() {
    _cache.insertBoolToCache(
      key: CacheConstants.isOnboardingShown,
      value: true,
    );
  }
}
