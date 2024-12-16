import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/styles/app_colors.dart';

class SocialMediaIconWidget extends StatelessWidget {
  final String svg;

  const SocialMediaIconWidget({super.key, required this.svg});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 40.h,
        width: 40.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(30),
          color: AppColors.modeGrey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            svg,
            color: AppColors.defaultTextColor,
          ),
        ),
      ),
    );
  }
}
