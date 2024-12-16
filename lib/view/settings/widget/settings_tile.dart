import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/text_styles.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {super.key,
      this.prefixIcon,
      required this.text,
      this.trailingText,
      required this.onPressed});

  final Icon? prefixIcon;
  final String text;
  final String? trailingText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        surfaceTintColor: AppColors.lightGrey,
        color: AppColors.lightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (prefixIcon != null) ...[
                  prefixIcon!,
                  const Gap(10),
                ],
                Text(text, style: MyTextStyles.textStyle14Regular),
                if (trailingText != null) ...[
                  const Spacer(),
                  Text(trailingText ?? '', style: MyTextStyles.textStyle14Bold),
                ],
              ]),
        ),
      ),
    );
  }
}
