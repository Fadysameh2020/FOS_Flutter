import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/text_styles.dart';

class CustomDropdownWidget<T> extends StatelessWidget {
  T? selectedItem;
  final List<T>? items;
  final String? hintText;
  final String Function(T) display;
  final void Function(T?)? onChanged;

  CustomDropdownWidget({
    super.key,
    required this.selectedItem,
    required this.items,
    required this.hintText,
    required this.onChanged,
    required this.display,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: DropdownButtonHideUnderline(
          child: Theme(
            data: Theme.of(context).copyWith(
              hintColor: Colors.grey.shade600,
            ),
            child: DropdownButton<T>(
              dropdownColor: Colors.white,
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColors.modeColor,
              ),
              hint: Text(
                hintText ?? '',
                style: MyTextStyles.textStyle14Medium
                    .copyWith(color: AppColors.modeGreyText),
              ),
              value: selectedItem,
              onChanged: onChanged,
              borderRadius: BorderRadius.circular(12),
              items: items?.map<DropdownMenuItem<T>>((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(
                    display(value),
                    style: MyTextStyles.textStyle14Medium,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
