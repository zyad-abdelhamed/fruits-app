import 'package:flutter/material.dart';

class PhoneNumberFieldDropDownButton extends StatelessWidget {
  const PhoneNumberFieldDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 4.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: "KW",
                items: const [
                  DropdownMenuItem(
                    value: "KW",
                    child: Row(
                      spacing: 4.0,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 24,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4),
                        Text('KW'),
                      ],
                    ),
                  ),
                ],

                onChanged: (value) {
                  // handle change
                },
                iconEnabledColor: Colors.transparent,
                dropdownColor: Colors.white,
              ),
            ),
            const VerticalDivider(
              color: Colors.grey,
              width: 1.0,
              thickness: 1.5,
              indent: 5.0,
              endIndent: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
