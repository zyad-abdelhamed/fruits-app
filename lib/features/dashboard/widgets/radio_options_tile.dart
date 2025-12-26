import 'package:flutter/material.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/features/dashboard/models/option_group_model.dart';

class OptionGroupWidget extends StatefulWidget {
  final String title;
  final List<OptionGroupModel> options;

  const OptionGroupWidget({
    super.key,
    required this.title,
    required this.options,
  });

  @override
  State<OptionGroupWidget> createState() => _OptionGroupWidgetState();
}

class _OptionGroupWidgetState extends State<OptionGroupWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.title),
      children: widget.options
          .map(
            (option) => _RadioOptionTile(
              option: option,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() => selectedValue = value);
              },
            ),
          )
          .toList(),
    );
  }
}

class _RadioOptionTile extends StatelessWidget {
  final OptionGroupModel option;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const _RadioOptionTile({
    required this.option,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      value: option.value,
      groupValue: groupValue,
      onChanged: onChanged,
      title: Text(option.label),
      subtitle: Text(option.price),
      activeColor: AppColors.primaryColor,
      dense: true,
    );
  }
}
