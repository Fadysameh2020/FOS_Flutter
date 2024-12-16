import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/styles/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField(
      {required this.controller, required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15.0,
        left: 15.0,
        right: 15.0,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: MyTextStyles.textStyle14Regular,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
            ),
          ),
        ),
        controller: controller,
      ),
    );
  }
}
