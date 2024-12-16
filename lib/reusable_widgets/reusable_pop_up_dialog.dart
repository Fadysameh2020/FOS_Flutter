import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fos_app/core/app_localiziations/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../core/app_strings/app_strings.dart';
import '../core/styles/text_styles.dart';
import '../core/values_manager.dart';
import 'default_button.dart';

class ReusablePopupDialog extends StatelessWidget {
  final String title;
  final String? content;
  final VoidCallback onPressed;
  final String buttonText;
  final Widget? widget;
  final bool dismissible;
  final bool popOnPressed;

  const ReusablePopupDialog({
    Key? key,
    required this.title,
    this.content,
    required this.onPressed,
    required this.buttonText,
    this.widget,
    this.dismissible = false,
    this.popOnPressed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Center(
          child: Text(
            title,
            style: MyTextStyles.textStyle24Bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (content != null)
              Text(
                content!,
                textAlign: TextAlign.center,
                style: MyTextStyles.textStyle16Regular
                    .copyWith(color: Colors.grey),
              ),
            if (widget != null) widget!,
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Flexible(
                  child: DefaultButton(
                    text: AppStrings.cancel.tr(context),
                    upperCase: false,
                    height: 50,
                    empty: true,
                    textStyle: MyTextStyles.textStyle16Medium,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Gap(10),
                Flexible(
                  child: DefaultButton(
                    text: buttonText,
                    upperCase: false,
                    height: 50,
                    textStyle: MyTextStyles.textStyle16Medium.copyWith(
                      color: Colors.white,
                    ),
                    // width: 150,
                    onTap: () {
                      if (popOnPressed) {
                        GoRouter.of(context).pop();
                      }
                      onPressed.call();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
        actionsPadding: EdgeInsets.only(bottom: AppPadding.p20),
      ),
    );
  }

  static void show({
    required BuildContext context,
    required String title,
    String? content,
    required VoidCallback onPressed,
    required String buttonText,
    Widget? widget,
    bool dismissible = false,
    bool popOnPressed = false,
  }) {
    showDialog(
      barrierDismissible: dismissible,
      context: context,
      builder: (BuildContext context) {
        return ReusablePopupDialog(
          title: title,
          content: content,
          onPressed: onPressed,
          buttonText: buttonText,
          widget: widget,
          dismissible: dismissible,
          popOnPressed: popOnPressed,
        );
      },
    );
  }
}
