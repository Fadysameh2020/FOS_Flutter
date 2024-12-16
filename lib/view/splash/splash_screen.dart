import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_router/routes.dart';
import '../../core/assets_data/assets_data.dart';
import '../../core/constants.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 1), () {
      // if (isLoggedIn) {
      GoRouter.of(context).go(AppRouter.appLayoutScreen);
      // } else {
      //   GoRouter.of(context).go(AppRouter.loginScreen);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: appPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsData.appLogo,
                fit: BoxFit.scaleDown,
              ),
              const Gap(10),
              Text(
                'Fos App',
                style: MyTextStyles.textStyle34Bold.copyWith(
                  color: primaryColor,
                ),
              ),
              // Column(
              //   children: [
              //     Directionality(
              //       textDirection: TextDirection.ltr,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             'Powered By ',
              //             style: TextStyle(
              //                 color: primaryColor,
              //                 fontSize: 18.sp,
              //                 fontWeight: FontWeight.bold),
              //           ),
              //           SizedBox(width: 5.w),
              //           // Image.asset(
              //           //   AssetsData.neonLogoLight,
              //           //   fit: BoxFit.cover,
              //           //   repeat: ImageRepeat.noRepeat,
              //           //   width: 100.w,
              //           // ),
              //         ],
              //       ),
              //     ),
              //     SizedBox(
              //       height: 20.h,
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
