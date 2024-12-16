import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../core/values_manager.dart';
import '../../../reusable_widgets/no_result_widget.dart';
import '../cubit/notifications_cubit.dart';
import 'notification_item_widget.dart';

class NotificationsListWidget extends StatelessWidget {
  const NotificationsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        var cubit = NotificationsCubit.get(context);
        return (cubit.notificationsModel?.data?.isEmpty ?? true)
            ? const NoResultWidget()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListView.separated(
                  controller: cubit.scrollController,
                  separatorBuilder: (context, index) => const Gap(10),
                  itemCount: cubit.notificationsModel?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return NotificationItemWidget(
                      notification: cubit.notificationsModel?.data?[index],
                    );
                  },
                ),
              );
      },
    );
  }
}
