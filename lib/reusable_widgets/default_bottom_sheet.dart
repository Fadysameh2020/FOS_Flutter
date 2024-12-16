import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../core/styles/app_colors.dart';
import '../core/styles/text_styles.dart';

void showOldDefaultBottomSheet({
  required BuildContext context,
  double? radius,
  double? height = 320,
  bool isScrollControlled = false,
  Widget? child,
}) {
  showModalBottomSheet(
    isScrollControlled: isScrollControlled,
    context: context,
    enableDrag: true,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(radius ?? 24.0),
      ),
    ),
    builder: (ctx) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(ctx).viewInsets.bottom,
      ),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    ),
  );
}


void showDefaultBottomSheet({
  required BuildContext context,
  double? radius,
  double? height = 320,
  required String text,
  bool? showButton,
  bool isScrollControlled = false,
  String? buttonText,
  void Function()? buttonOnTap,
  Widget? child,
  Widget? child2,
  Widget? child3,
}) {
  showModalBottomSheet(
    isScrollControlled: isScrollControlled,
    context: context,
    enableDrag: true,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(radius ?? 45.0),
      ),
    ),
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: height,
        width: double.infinity,
        decoration:  BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: CustomScrollView(
            slivers: [
              //header widget
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        text,
                        style: MyTextStyles.textStyle18Bold.copyWith(
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              // scrollable child
              if (child != null) ...[
                child,
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
              ],
              if (child2 != null) ...[
                child2,
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
              ],
              if (child3 != null) ...[
                child3,
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    ),
  );
}
