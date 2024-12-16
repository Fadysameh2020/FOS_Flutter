import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/text_styles.dart';

AppBar DefaultAppBar({
  required context,
  title,
  Color? color = Colors.black,
  List<Widget>? actions,
  bool? skipBackButton,
  bool? centerTitle = false,
  PreferredSizeWidget? bottom,
  double? elevation,
}) =>
    AppBar(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: AppColors.backgroundColor,
      shadowColor: Colors.grey,
      title: Text(
        title ?? '',
        style: MyTextStyles.textStyle18Medium,
      ),
      centerTitle: centerTitle,
      bottom: bottom,
      leading: skipBackButton == true
          ? null
          : IconButton(
              icon: Icon(
                Icons.arrow_back_sharp,
                color: AppColors.modeColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      actions: actions,
    );
