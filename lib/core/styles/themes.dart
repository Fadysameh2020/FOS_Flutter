import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fos_app/core/styles/text_styles.dart';

import '../constants.dart';
import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: createMaterialColor(AppColors.primaryColor),
  // colorSchemeSeed: primaryColor,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  fontFamily: myFontMedium,
  hoverColor: Colors.transparent,
  iconTheme: const IconThemeData(
    color: AppColors.secondaryColor,
  ),
  primaryColor: AppColors.primaryColor,
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: primaryColor,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Colors.black),
  ),
  appBarTheme: const AppBarTheme(
    scrolledUnderElevation: 0,
    titleSpacing: 20,
    iconTheme: IconThemeData(
      color: AppColors.primaryColor,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.blackColor,
      statusBarIconBrightness: Brightness.light,
    ),
    // backgroundColor: AppColors.blackColor,
    elevation: 0,
  ),

  // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //   type: BottomNavigationBarType.fixed,
  //   selectedItemColor: AppColors.iconsColor,
  //   unselectedItemColor: AppColors.iconsColor,
  //   selectedLabelStyle: TextStyle(
  //     fontSize: 14,
  //     fontWeight: FontWeight.w500,
  //     color: AppColors.iconsColor,
  //   ),
  //   unselectedLabelStyle: TextStyle(
  //     fontSize: 14,
  //     fontWeight: FontWeight.w500,
  //     color: AppColors.iconsColor,
  //   ),
  //   selectedIconTheme: IconThemeData(
  //     size: 32,
  //   ),
  //   unselectedIconTheme: IconThemeData(
  //     size: 32,
  //   ),
  //   backgroundColor: Color(0xffFFFDF9),
  //   //backgroundColor: HexColor('333739'),
  //   elevation: 20,
  // ),
  scaffoldBackgroundColor: AppColors.whiteColor,
);
ThemeData darkTheme = ThemeData(
  primarySwatch: createMaterialColor(AppColors.primaryColor),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  fontFamily: myFontMedium,
  hoverColor: Colors.transparent,
  iconTheme: const IconThemeData(
    color: AppColors.secondaryColor,
  ),
  primaryColor: AppColors.primaryColor,
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: primaryColor,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Colors.white),
  ),
  appBarTheme: const AppBarTheme(
    scrolledUnderElevation: 0,
    titleSpacing: 20,
    iconTheme: IconThemeData(
      color: AppColors.primaryColor,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.whiteColor,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: AppColors.whiteColor,
    elevation: 0,
  ),
  scaffoldBackgroundColor: AppColors.secondaryColor,
);

MaterialColor createMaterialColor(Color color) {
  List<int> strengths = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int strength in strengths) {
    final double ds = strength / 900;
    swatch[strength] = Color.fromRGBO(r, g, b, ds);
  }
  return MaterialColor(color.value, swatch);
}
