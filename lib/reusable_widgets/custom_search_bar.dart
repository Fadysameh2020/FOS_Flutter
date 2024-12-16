import 'package:flutter/material.dart';
import 'package:fos_app/core/app_localiziations/app_localizations.dart';

import '../core/app_strings/app_strings.dart';
import '../core/constants.dart';
import '../core/styles/text_styles.dart';
import '../core/values_manager.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final Function()? onClose; // Add onClose function
  final Function()? onTap;
  final String? hintText;
  final bool? autoFocus;
  final Widget? suffix;

  CustomSearchBar({
    this.controller,
    this.onSubmitted,
    this.onChanged,
    this.onClose,
    this.hintText,
    this.onTap,
    this.autoFocus,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p4,
      ),
      height: 55,
      child: TextField(
        cursorColor: primaryColor,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onTap: onTap,
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        autofocus: autoFocus ?? false,
        decoration: InputDecoration(
          // filled: true,
          fillColor: Colors.grey,
          contentPadding: EdgeInsets.symmetric(
              horizontal: AppPadding.p16, vertical: AppPadding.p8),
          // suffixIcon: controller == null || controller!.text == ""
          //     ? null
          //     : IconButton(
          //         onPressed: onClose,
          //         icon: Icon(
          //           Icons.close,
          //           color: Colors.black,
          //         ),
          //       ),
          suffixIcon: suffix,
          hintText: hintText ?? AppStrings.search.tr(context),
          hintStyle: MyTextStyles.textStyle16Regular.copyWith(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey), // Set border color
            borderRadius: BorderRadius.circular(52.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey), // Set border color
            borderRadius: BorderRadius.circular(52.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey), // Set border color
            borderRadius: BorderRadius.circular(52.0),
          ),
        ),
      ),
    );
  }
}
