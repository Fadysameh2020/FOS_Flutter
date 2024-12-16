import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_router/routes.dart';
import 'app_colors.dart';

// const String? myFontBold = 'LatoBold';
// const String? myFontMedium = 'LatoRegular';
// const String? myFontRegular = 'LatoLight';
const String? markoOneFont = 'MarkoOne';
const String? myFontBold = 'RobotoBold';
const String? myFontMedium = 'RobotoMedium';
const String? myFontRegular = 'RobotoRegular';
BuildContext? customContext =
    AppRouter.router.routerDelegate.navigatorKey.currentContext;
 
abstract class MyTextStyles {
  //caption 12
  static TextStyle textStyle12Regular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontRegular,
  );

  static TextStyle textStyle12Medium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontMedium,
  );
  static TextStyle textStyle12Bold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontBold,
  );

  //body 14
  static TextStyle textStyle14Regular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontRegular,
  );
  static TextStyle textStyle14Medium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontMedium,
  );
  static TextStyle textStyle14Bold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontBold,
  );

  static TextStyle hintStyle = TextStyle(
    fontSize: 15.sp,
    color: Colors.grey,
    fontFamily: myFontRegular,
  );

  //subtitle 16

  static TextStyle textStyle16Regular = TextStyle(
    fontSize: 16.sp,
    // fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontRegular,
  );
  static TextStyle textStyle16Medium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontMedium,
  );
  static TextStyle textStyle16Bold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontBold,
  );

  //subtitle 18
  static TextStyle textStyle18Regular = TextStyle(
    fontSize: 18.sp,
    // fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontRegular,
  );
  static TextStyle textStyle18Medium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontMedium,
  );
  static TextStyle textStyle18Bold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontBold,
  );

  //subtitle 20
  static TextStyle textStyle20Regular = TextStyle(
    fontSize: 20.sp,
    // fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontRegular,
  );
  static TextStyle textStyle20Medium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontMedium,
  );
  static TextStyle textStyle20Bold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontBold,
  );

  //title  22
  static TextStyle textStyle22Regular = TextStyle(
    fontSize: 22.sp,
    // fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontRegular,
  );
  static TextStyle textStyle22Medium = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontMedium,
  );
  static TextStyle textStyle22Bold = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontBold,
  );

  //title  24
  static TextStyle textStyle24Regular = TextStyle(
    fontSize: 24.sp,
    // fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontRegular,
  );
  static TextStyle textStyle24Medium = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontMedium,
  );
  static TextStyle textStyle24Bold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontBold,
  );

  //title  26
  static TextStyle textStyle26Regular = TextStyle(
    fontSize: 26.sp,
    // fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontRegular,
  );
  static TextStyle textStyle26Medium = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontMedium,
  );
  static TextStyle textStyle26Bold = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.bold,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontBold,
  ); //title  28
  static TextStyle textStyle28Regular = TextStyle(
    fontSize: 28.sp,
    // fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontRegular,
  );
  static TextStyle textStyle28Medium = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontMedium,
  );
  static TextStyle textStyle28Bold = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontBold,
  );

  //Headline 34
  static TextStyle textStyle34Regular = TextStyle(
    fontSize: 34.sp,
    fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontRegular,
  );
  static TextStyle textStyle34Medium = TextStyle(
    fontSize: 34.sp,
    fontWeight: FontWeight.w500,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontMedium,
  );
  static TextStyle textStyle34Bold = TextStyle(
    fontSize: 34.sp,
    fontWeight: FontWeight.bold,
    color: Theme.of(customContext!).textTheme.titleLarge?.color!,
    fontFamily: myFontBold,
  );
}
