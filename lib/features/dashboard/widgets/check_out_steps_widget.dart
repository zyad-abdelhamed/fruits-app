import 'package:flutter/material.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';
import 'package:fruits_app/features/dashboard/views/check_out_view.dart';
import 'package:fruits_app/features/dashboard/widgets/dashed_divider.dart';

class CheckoutStepsWidget extends StatelessWidget {
  const CheckoutStepsWidget({super.key, required this.currnetStep});

  final CheckoutSteps currnetStep;

  @override
  Widget build(BuildContext context) {
    final steps = CheckoutSteps.values;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < steps.length; i++) ...[
          // Column لكل خطوة (Container + Text)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StepContainer(step: steps[i], currnetStepIndex: currnetStep),
              const SizedBox(height: 8),
              StepText(step: steps[i], currnetStepIndex: currnetStep),
            ],
          ),

          // DashedDivider بين الأعمدة فقط وليس بعد آخر عنصر
          if (i != steps.length - 1)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: const DashedDivider(),
              ),
            ),
        ],
      ],
    );
  }
}

class StepText extends StatelessWidget {
  const StepText({
    super.key,
    required this.step,
    required this.currnetStepIndex,
  });

  final CheckoutSteps step, currnetStepIndex;

  @override
  Widget build(BuildContext context) {
    final bool isDone = step.index == currnetStepIndex.index;
    final Color color = isDone ? AppColors.primaryColor : Colors.grey;
    return Text(
      step.name,
      style: context.bodyLarge.copyWith(color: color),
      textAlign: TextAlign.center,
    );
  }
}

class StepContainer extends StatelessWidget {
  const StepContainer({
    super.key,
    required this.step,
    required this.currnetStepIndex,
  });

  final CheckoutSteps step, currnetStepIndex;

  @override
  Widget build(BuildContext context) {
    final bool isDone = step.index == currnetStepIndex.index;
    final Color color = isDone ? AppColors.primaryColor : Colors.grey;

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 2),
      ),
      child: Icon(Icons.circle, color: color, size: 16),
    );
  }
}
