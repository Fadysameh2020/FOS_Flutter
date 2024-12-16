import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/assets_data/assets_data.dart';
import '../../../core/constants.dart';
import '../../../core/notification_helper/notification_onTap.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/text_styles.dart';
import '../../../models/notification_model.dart';

class NotificationItemWidget extends StatelessWidget {
  final NotificationModel? notification;

  const NotificationItemWidget({required this.notification, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        notificationOnTap(
            type: notification?.caseData, info: notification?.info);
      },
      child: Card(
        color: AppColors.modeGrey,
        surfaceTintColor: AppColors.modeGrey,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: notification?.image == null
                        ? AssetImage(AssetsData.dayraIconPng)
                        : NetworkImage(notification?.image ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification?.title ?? '',
                      style: MyTextStyles.textStyle14Bold.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Gap(7),
                    if (notification?.body != "") ...[
                      Text(
                        notification?.body ?? '',
                        style: MyTextStyles.textStyle12Regular.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Gap(7),
                    ],
                    Text(
                      DateFormat('dd/MM/yyyy').format(
                              notification?.dateTime ?? DateTime(2000)) +
                          '  ' +
                          DateFormat('hh:mm a')
                              .format(notification?.dateTime ?? DateTime(2000)),
                      style: MyTextStyles.textStyle14Regular,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
