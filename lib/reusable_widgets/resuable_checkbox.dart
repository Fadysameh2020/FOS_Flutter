import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/styles/app_colors.dart';
import '../core/styles/text_styles.dart';

class ReusableCheckBox extends StatelessWidget {
  final bool controller;
  final String title;
  final Function(bool) onChanged;
  ReusableCheckBox({
    required this.title,
    required this.controller,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          value: controller,
          shouldShowBorder: true,
          borderColor: primaryColor,
          checkedFillColor: primaryColor,
          uncheckedFillColor: AppColors.backgroundColor,
          uncheckedIconColor: AppColors.backgroundColor,
          checkedIconColor: Colors.white,
          borderRadius: 2,
          borderWidth: 2,
          checkBoxSize: 17,
          onChanged: onChanged,
        ),
        Expanded(
          child: Text(
            title,
            style: MyTextStyles.textStyle16Medium,
          ),
        ),
      ],
    );
  }
}
