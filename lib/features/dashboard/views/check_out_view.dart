import 'package:flutter/material.dart';
import 'package:fruits_app/core/constants/app_strings.dart';
import 'package:fruits_app/core/widgets/back_button.dart';
import 'package:fruits_app/features/dashboard/widgets/check_out_page_view.dart';
import 'package:fruits_app/features/dashboard/widgets/check_out_process_button.dart';
import 'package:fruits_app/features/dashboard/widgets/check_out_steps_widget.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  late final ValueNotifier<CheckoutSteps> stepNotifier;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    stepNotifier = ValueNotifier<CheckoutSteps>(CheckoutSteps.time);
    _pageController = PageController();
  }

  @override
  void dispose() {
    stepNotifier.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.checkout),
        leading: const AppBackButton(),
      ),

      body: ValueListenableBuilder<CheckoutSteps>(
        valueListenable: stepNotifier,
        builder: (_, CheckoutSteps currStep, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // step indicator
                CheckoutStepsWidget(currnetStep: currStep),

                const SizedBox(height: 16),
                // checkout page view
                child!,

                // next button
                CheckOutProcessButton(
                  onPressed: () {
                    if (currStep.index < 2) {
                      stepNotifier.value =
                          CheckoutSteps.values[currStep.index + 1];
                      _pageController.animateToPage(
                        currStep.index + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  title: currStep.index < 2
                      ? AppStrings.continueText
                      : AppStrings.placeOrder,
                ),
              ],
            ),
          );
        },

        child: Expanded(
          flex: 3,
          child: CheckoutPageView(pageController: _pageController),
        ),
      ),
    );
  }
}

enum CheckoutSteps { time, address, payment }
