import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/styles/app_colors.dart';
import '../../../reusable_widgets/default_shimmer.dart';

class NotificationsLoadingWidget extends StatelessWidget {
  const NotificationsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.separated(
        separatorBuilder: (context, index) => const Gap(10),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
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
                  // Shimmer for the circular image
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300], // Placeholder color for shimmer
                    ),
                    child: DefaultShimmer(
                      radius: 50,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  const Gap(15),

                  // Shimmer for the text content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title shimmer
                        DefaultShimmer(
                          width: 150.w,
                          height: 15.h,
                          radius: 8,
                        ),
                        const Gap(7),

                        // Body text shimmer
                        DefaultShimmer(
                          width: 180.w,
                          height: 12.h,
                          radius: 8,
                        ),
                        const Gap(7),

                        // Date shimmer
                        DefaultShimmer(
                          width: 100.w,
                          height: 10.h,
                          radius: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
