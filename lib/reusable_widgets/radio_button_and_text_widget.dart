import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/text_styles.dart';
import 'default_radio_button.dart';

class RadioButtonWithTextWidget extends StatelessWidget {
  const RadioButtonWithTextWidget(
      {super.key,
      required this.text,
      this.subtitle,
      required this.value,
      required this.selectedValue,
      this.onChanged});

  final String text;
  final String? subtitle;
  final String? value;
  final String? selectedValue;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // When the entire widget is tapped, call onChanged with the provided value.
        if (onChanged != null && value != selectedValue) {
          onChanged!(value);
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: MyTextStyles.textStyle14Medium,
                ),
              ),
              const Gap(5),
              DefaultRadioButton(
                  value: value,
                  selectedValue: selectedValue,
                  onChanged: (value) {
                    onChanged!(value);
                  }),
            ],
          ),
          if (subtitle != null)
            Text(
              subtitle ?? '',
              style: MyTextStyles.textStyle12Regular,
            ),
          Divider(
            color: AppColors.defaultTextColor,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
