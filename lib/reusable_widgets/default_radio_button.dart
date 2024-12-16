import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/styles/app_colors.dart';

class DefaultRadioButton extends StatelessWidget {
  const DefaultRadioButton(
      {super.key,
      required this.value,
      required this.selectedValue,
      required this.onChanged});

  final String? value;
  final String? selectedValue;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Radio<String?>.adaptive(
      activeColor: AppColors.secondaryColor,
      fillColor: MaterialStateProperty.all(AppColors.secondaryColor),
      value: value,
      groupValue: selectedValue,
      onChanged: onChanged,
    );
  }
}
