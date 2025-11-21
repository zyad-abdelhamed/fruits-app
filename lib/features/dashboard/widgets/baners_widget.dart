import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/constants_values.dart';
import 'package:fruits_app/core/constants/images_routes_constants.dart';
import 'package:fruits_app/core/utils/extentions/responsive_extention.dart';
import 'package:fruits_app/core/widgets/custom_dots_indicator.dart';

class BanersWidget extends StatefulWidget {
  const BanersWidget({super.key});

  @override
  State<BanersWidget> createState() => _BanersWidgetState();
}

class _BanersWidgetState extends State<BanersWidget> {
  late final PageController _pageController;
  late final ValueNotifier<int> _currentIndexNotifier;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _currentIndexNotifier = ValueNotifier<int>(0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: ConstantsValues.dashBoardColumnSpacing,
      children: [
        SizedBox(
          height: context.height * 0.20,
          width: context.width,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (i) => _currentIndexNotifier.value = i,
            itemBuilder: (_, int i) {
              return Image.asset(
                ImagesRoutesConstants.onboarding,
                fit: BoxFit.fill,
              );
            },
            itemCount: 3,
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _currentIndexNotifier,
          builder: (_, int currentIndex, __) {
            return CustomDotsIndicator(count: 3, selectedIndex: currentIndex);
          },
        ),
      ],
    );
  }
}
