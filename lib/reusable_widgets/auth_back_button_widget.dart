import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/styles/app_colors.dart';

class AuthBackButtonWidget extends StatelessWidget {
  const AuthBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.backgroundColor,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
