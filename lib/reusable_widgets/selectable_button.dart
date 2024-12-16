import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/text_styles.dart';

class SelectableButton extends StatelessWidget {
  final bool isSelected;
  final bool showSelectedIcon;
  final double? height;
  final double? width;
  final String text;
  final void Function()? onTap;

  const SelectableButton(
      {super.key,
      required this.isSelected,
      required this.text,
      this.onTap,
      this.height,
      this.width = double.infinity,
      this.showSelectedIcon = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        onTap?.call();
      },
      child: Column(
        children: [
          Container(
            width: width,
            height: height ?? 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              // border: isSelected?null: const Border(
              //   bottom: BorderSide(width: 1.0, color:AppColors.whiteColor),
              // ),
              boxShadow: [
                if (isSelected)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(0.0, 1.5), //(x,y)
                    blurRadius: 1.0,
                  ),
              ],
              color: isSelected ? Colors.black : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (showSelectedIcon) ...[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 2,
                              color: isSelected
                                  ? AppColors.backgroundColor
                                  : AppColors.primaryColor)),
                      child: Icon(
                        Icons.check,
                        size: 18,
                        color: AppColors.backgroundColor,
                      ),
                    ),
                    const Gap(10)
                  ],
                  Flexible(
                    child: AutoSizeText(
                      textAlign: TextAlign.center,
                      text,
                      style: MyTextStyles.textStyle14Bold.copyWith(
                        color: isSelected ? AppColors.whiteColor : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (!isSelected)
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.blackColor,
            ),
        ],
      ),
    );
  }
}
