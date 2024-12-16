import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/assets_data/assets_data.dart';

class NoResultWidget extends StatelessWidget {
  const NoResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: SvgPicture.asset(AssetsData.noResultsSvg),
          ),
          // const Gap(10),
          // Text(
          //   AppStrings.noResults.tr(context),
          //   style: MyTextStyles.textStyle14Medium
          //       .copyWith(color: const Color(0xFF6B6D79)),
          // ),
        ],
      ),
    );
  }
}
