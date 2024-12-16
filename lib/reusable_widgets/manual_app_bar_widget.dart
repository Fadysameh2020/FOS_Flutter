import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/styles/text_styles.dart';

class ManualAppBarWidget extends StatelessWidget {
  final String? title;
  final bool skipBackButton;
  final Widget? trailing;

  const ManualAppBarWidget({
    // this.settings = true,
    this.title,
    this.skipBackButton = false,
    this.trailing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (!skipBackButton) ...[
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                size: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 35.w,
            ),
          ],
          SizedBox(
            width: 10.w,
          ),
          if (title != null)
            Text(
              title!,
              style: MyTextStyles.textStyle18Medium.copyWith(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          if (trailing != null) ...[
            Spacer(),
            trailing!,
          ],
        ],
      ),
    );
  }
}
