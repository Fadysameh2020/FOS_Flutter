import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../core/constants.dart';
import '../core/styles/app_colors.dart';

class FlutterMessage {
  static void show({
    required String message,
    bool long = false,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: long ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.secondaryColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
