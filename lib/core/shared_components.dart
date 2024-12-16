
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fos_app/core/styles/app_colors.dart';
import 'package:fos_app/core/styles/text_styles.dart';
import 'package:fos_app/core/values_manager.dart';

void showToast({
  String? text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text!,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStates { ERROR, SUCCESS, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget myDivider() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Container(
      width: double.infinity,
      height: 1,
      color: AppColors.dividerColor,
    ),
  );
}

Widget blackDivider() {
  return Container(
    width: 1.5,
    height: 24,
    color: Colors.black,
    margin: const EdgeInsets.symmetric(horizontal: 4),
  );
}
// Widget defaultCircularProgressIndicator() {
//   return Platform.isIOS
//       ? const CircularProgressIndicator.adaptive()
//       : Center(
//           child: const CircularProgressIndicator(
//             color: AppColors.primaryColor,
//           ),
//         );
// }

Widget SettingsDivider() {
  return Padding(
    padding: EdgeInsets.all(AppPadding.p8),
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0), // Adjust the values as needed
          topRight: Radius.circular(5.0),
        ),
      ),
      child: const ClipOval(
        child: Divider(
          height: 1,
          thickness: 2,
          color: AppColors.whiteColor,
        ),
      ),
    ),
  );
}

Widget HeadlineText({required String text}) => Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p14,
      ),
      child: Text(
        text,
        style: MyTextStyles.textStyle14Medium.copyWith(
          color: Colors.black,
        ),
      ),
    );

Widget MediumHeadlineText({required String text}) => Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p8,
        vertical: AppPadding.p8,
      ),
      child: Text(
        text,
        style: MyTextStyles.textStyle18Bold,
      ),
    );

Widget LargeHeadlineText({required String text}) => Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p8,
        vertical: AppPadding.p8,
      ),
      child: Text(
        text,
        style: MyTextStyles.textStyle28Bold,
      ),
    );

Widget HomeHeadlineText({required String text}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        text,
        style: MyTextStyles.textStyle18Medium.copyWith(
          color: Colors.black,
        ),
      ),
    );
