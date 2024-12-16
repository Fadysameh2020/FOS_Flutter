
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fos_app/core/app_localiziations/app_localizations.dart';
import 'package:fos_app/view/notifications/widget/notifications_list_widget.dart';
import 'package:fos_app/view/notifications/widget/notifications_loading_widget.dart';

import '../../core/app_strings/app_strings.dart';
import '../../core/constants.dart';
import '../../core/services/services_locator.dart';
import '../../reusable_widgets/default_app_bar.dart';
import 'cubit/notifications_cubit.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NotificationsCubit>()
        ..startScrollingListener()
        ..getUserNotifications(),
      child: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          var cubit = NotificationsCubit.get(context);
          return RefreshIndicator(
            color: primaryColor,
            backgroundColor: Colors.white,
            onRefresh: NotificationsCubit.get(context).getUserNotifications,
            child: Scaffold(
              appBar: DefaultAppBar(
                  title: AppStrings.notifications.tr(context),
                  context: context),
              body: cubit.notificationsModel == null
                  ? const NotificationsLoadingWidget()
                  : const NotificationsListWidget(),
            ),
          );
        },
      ),
    );
  }
}
