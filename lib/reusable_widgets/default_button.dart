
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/text_styles.dart';

class DefaultButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? icon;
  final double? borderRadius;
  final String text;
  final bool borderRadiusTopOnly;
  final bool empty;
  final TextStyle? textStyle;
  final Color? color;
  final double? fontSize;
  final bool upperCase;
  final void Function()? onTap;
  final bool? loadingController;

  const DefaultButton({
    super.key,
    this.height,
    this.width,
    this.icon,
    this.borderRadius,
    required this.text,
    this.textStyle,
    this.fontSize,
    this.color,
    this.onTap,
    this.borderRadiusTopOnly = false,
    this.loadingController = false,
    this.upperCase = false,
    this.empty = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loadingController == false ? onTap : null,
      child: Container(
        height: height ?? 50,
        width: width ?? 200,
        decoration: BoxDecoration(
          border: Border.all(
            color: empty
                ? AppColors.primaryColor
                : (color ?? AppColors.primaryColor),
          ),
          borderRadius: borderRadiusTopOnly
              ? BorderRadius.only(
                  topRight: Radius.circular(borderRadius ?? 6),
                  topLeft: Radius.circular(borderRadius ?? 6),
                )
              : BorderRadius.circular(borderRadius ?? 80),
          color: empty ? Colors.white : (color ?? AppColors.primaryColor),
        ),
        child: loadingController ?? false
            ? SizedBox(
                height: 20.w,
                width: 20.w,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    icon!,
                    Gap(10),
                  ],
                  Text(
                    upperCase ? text.toUpperCase() : text,
                    style: textStyle ??
                        MyTextStyles.textStyle16Medium.copyWith(
                          fontSize: fontSize ?? 18,
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
