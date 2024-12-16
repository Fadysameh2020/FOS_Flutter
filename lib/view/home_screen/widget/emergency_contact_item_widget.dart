import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/text_styles.dart';
import '../../app_layout/cubit/app_cubit.dart';

class EmergencyContactItemWidget extends StatelessWidget {
  const EmergencyContactItemWidget({
    super.key,
    required this.image,
    required this.text,
    required this.number,
  });

  final String image;
  final String text;
  final num number;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppCubit.get(context).launchCall(number: number);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.modeGrey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SvgPicture.asset(svg),
                Image.asset(image),
                const Gap(5),
                Text(
                  text,
                  style: MyTextStyles.textStyle14Medium,
                ),
                if (number != null) ...[
                  const Gap(5),
                  Text(
                    number.toString(),
                    style: MyTextStyles.textStyle14Medium,
                  ),
                ],
              ]),
        ),
      ),
    );
  }
}
