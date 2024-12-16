import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/styles/app_colors.dart';
import '../core/styles/text_styles.dart';
import '../core/values_manager.dart';

class CustomExpansionTile extends StatelessWidget {
  final String? title;
  final List<Widget>? children;
  const CustomExpansionTile({
    required this.title,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(AppSize.p10),
      ),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          dense: true,
          title: Text(
            title ?? '',
            style: MyTextStyles.textStyle16Bold.copyWith(
              color: Colors.black,
            ),
          ),
          children: children ?? [],
        ),
      ),
    );
  }
}
