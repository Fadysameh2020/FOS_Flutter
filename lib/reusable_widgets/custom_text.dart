import 'package:flutter/material.dart';

import '../core/app_router/routes.dart';

var navigatorKey = AppRouter.router.routerDelegate.navigatorKey;

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    super.key,
    required this.textStyle,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.maxLines,
  });

  CustomText.headlineLarge(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ??
              Theme.of(
                navigatorKey!.currentContext!,
              ).textTheme.headlineLarge,
        );

  CustomText.headlineMedium(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ??
              Theme.of(navigatorKey!.currentContext!).textTheme.headlineMedium,
        );

  CustomText.headlineSmall(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ??
              Theme.of(navigatorKey!.currentContext!).textTheme.headlineSmall,
        );

  CustomText.titleLarge(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ??
              Theme.of(navigatorKey!.currentContext!).textTheme.titleLarge,
        );

  CustomText.titleMedium(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ??
              Theme.of(navigatorKey!.currentContext!).textTheme.titleMedium,
        );

  CustomText.titleSmall(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ??
              Theme.of(navigatorKey!.currentContext!).textTheme.titleSmall,
        );

  CustomText.bodySmall(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ??
              Theme.of(navigatorKey!.currentContext!).textTheme.bodySmall,
        );

  CustomText.bodyMedium(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ??
              Theme.of(navigatorKey!.currentContext!).textTheme.bodyMedium,
        );

  CustomText.bodyLarge(
    String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          textStyle: textStyle ??
              Theme.of(navigatorKey!.currentContext!).textTheme.bodyLarge,
        );

  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          Theme.of(navigatorKey!.currentContext!).textTheme.displayMedium,
      textAlign: textAlign ?? TextAlign.center,
      textScaler: MediaQuery.textScalerOf(context),
      textDirection: textDirection,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
