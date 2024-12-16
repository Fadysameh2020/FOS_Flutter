import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fos_app/core/app_localiziations/app_localizations.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import '../../core/app_strings/app_strings.dart';
import '../../core/constants.dart';
import '../../core/notification_helper/fcm_helper.dart';
import '../../core/notification_helper/notification_controller.dart';
import '../../core/styles/app_colors.dart';
import 'cubit/app_cubit.dart';

class AppLayoutScreen extends StatefulWidget {
  const AppLayoutScreen({super.key});

  @override
  State<AppLayoutScreen> createState() => _AppLayoutScreenState();
}

class _AppLayoutScreenState extends State<AppLayoutScreen> {
  @override
  initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   AwesomeNotifications().setListeners(
    //       onActionReceivedMethod:
    //           NotificationsController.onActionReceivedMethod,
    //       onNotificationCreatedMethod:
    //           NotificationsController.onNotificationCreatedMethod,
    //       onNotificationDisplayedMethod:
    //           NotificationsController.onNotificationDisplayedMethod,
    //       onDismissActionReceivedMethod:
    //           NotificationsController.onDismissActionReceivedMethod);
    //   FCMHelper.initialMessageHandler(context: context);
    //   FCMHelper.onMessageOpenedAppHandler(context: context);
    //   if (AppCubit.get(context).locale == null) {
    //     AppCubit.get(context).saveDeviceLocale(context: context);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: LazyLoadIndexedStack(
            index: cubit.navBarIndex,
            children: cubit.screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: primaryColor,
            unselectedItemColor: AppColors.modeColor,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: AppColors.modeColor,
                ),
                activeIcon: Icon(Icons.home),
                label: AppStrings.home.tr(context),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                  color: AppColors.modeColor,
                ),
                activeIcon: Icon(Icons.settings),
                label: AppStrings.settings.tr(context),
              ),
            ],
            currentIndex: cubit.navBarIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index: index, context: context);
            },
          ),
        );
      },
    );
  }
}
//
// class BottomAppBarWithNotchPainter extends CustomPainter {
//   final double notchRadius;
//   final double notchMargin;
//
//   BottomAppBarWithNotchPainter(
//       {required this.notchRadius, required this.notchMargin});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors
//           .grey[300]! // Adjust this color to match the desired border color
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1;
//
//     final path = Path();
//
//     final notchCenter = size.width / 2;
//     final notchStart = notchCenter - notchRadius - notchMargin;
//     final notchEnd = notchCenter + notchRadius + notchMargin;
//
//     // Start drawing the border
//     path.moveTo(0, 0);
//     path.lineTo(notchStart, 0);
//
//     // Draw the notch
//     path.quadraticBezierTo(
//       notchCenter,
//       notchRadius + notchMargin,
//       notchEnd,
//       0,
//     );
//
//     // Continue drawing the border
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//
//     // Draw the path
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
// return Scaffold(
// body: LazyLoadIndexedStack(
// index: cubit.navBarIndex,
// children: cubit.screens,
// ),
// bottomNavigationBar: Container(
// decoration: BoxDecoration(
// border: Border(
// top: BorderSide(
// color: Colors.grey[300]!,
// width: 1,
// ), // Top border (line color)
// ),
// ),
// child: CustomPaint(
// painter: BottomAppBarWithNotchPainter(
// notchMargin: 8,
// notchRadius: 30,
// ),
// child: BottomAppBar(
// elevation: 3,
// shape: const CircularNotchedRectangle(),
// notchMargin: 15.0,
// color: AppColors.regularTextColor,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: <Widget>[
// IconButton(
// icon: Icon(
// cubit.navBarIndex == 0
// ? Icons.home
//     : Icons.home_outlined,
// color: cubit.navBarIndex == 0
// ? primaryColor
//     : AppColors.modeColor,
// size: 30,
// ),
// onPressed: () =>
// cubit.changeBottomNavBar(index: 0, context: context),
// ),
// SizedBox(width: 20), // Space for the floating action button
// IconButton(
// icon: Icon(
// cubit.navBarIndex == 2
// ? Icons.settings
//     : Icons.settings_outlined,
// color: cubit.navBarIndex == 2
// ? primaryColor
//     : AppColors.modeColor,
// size: 30,
// ),
// onPressed: () =>
// cubit.changeBottomNavBar(index: 2, context: context),
// ),
// ],
// ),
// ),
// ),
// ),
// floatingActionButtonLocation:
// FloatingActionButtonLocation.centerDocked,
// floatingActionButton: FloatingActionButton(
// shape: const CircleBorder(),
// onPressed: () =>
// cubit.changeBottomNavBar(index: 1, context: context),
// backgroundColor: primaryColor,
// child: Icon(
// Icons.qr_code_2_outlined,
// color: Colors.white,
// size: 25,
// ),
// ),
// );
