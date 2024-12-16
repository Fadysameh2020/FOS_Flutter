import 'package:flutter/material.dart';
import 'package:fos_app/core/app_localiziations/app_localizations.dart';
import 'package:gap/gap.dart';

import '../../../core/app_strings/app_strings.dart';
import '../../../core/constants.dart';
import '../../../core/shared_components.dart';
import '../../../reusable_widgets/default_bottom_sheet.dart';
import '../../../reusable_widgets/designed_form_field.dart';
import '../core/styles/text_styles.dart';

class ReusableFormFieldBottomSheetWidget extends StatelessWidget {
  final String? title;
  final String? controller;
  final String? hintText;
  final Widget? bottomSheetChild;

  const ReusableFormFieldBottomSheetWidget(
      {super.key,
      required this.title,
      required this.bottomSheetChild,
      required this.controller,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineText(
            text: title ?? '',
          ),
          Gap(5),
          DesignedFormField(
            hintText: hintText ??
                (controller == null
                    ? AppStrings.select.tr(context)
                    : controller),
            readOnly: true,
            hintStyle: MyTextStyles.textStyle16Regular.copyWith(
              fontWeight: FontWeight.w400,
            ),
            borderColor: primaryColor,
            suffixIcon: Icon(
              Icons.keyboard_arrow_up_outlined,
            ),
            onTap: () {
              showDefaultBottomSheet(
                height: 500,
                context: context,

                text: title ?? "",
                child: bottomSheetChild,
              );
            },
          ),
        ],
      ),
    );
  }
}
