import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/app_router/routes.dart';
import '../../../core/constants.dart';
import '../../../models/notification_model.dart';
import '../../../repositories/notifications_repository/notifications_repo.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepo repo;

  NotificationsCubit({required this.repo}) : super(NotificationsInitial());

  static NotificationsCubit get(context) => BlocProvider.of(context);

  var scrollController = ScrollController();

  void startScrollingListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent * 0.8 &&
          notificationsModel != null) {
        getUserNotifications(
          isFirstTime: false,
        );
      }
    });
  }

  PaginatedNotificationsModel? notificationsModel;
  int page = 1;
  bool gettingMoreNotifications = false;

  Future<void> getUserNotifications({bool isFirstTime = true}) async {
    if (gettingMoreNotifications) return;

    if (isFirstTime) {
      notificationsModel = null;
      page = 1;
    }
    if (!isFirstTime && page > notificationsModel!.pagination!.totalPages!) {
      return;
    }
    gettingMoreNotifications = true;
    emit(GetUserNotificationsLoadingState());
    var result = await repo.getUserNotifications(page: page);
    result.fold((failure) {
      gettingMoreNotifications = false;
      emit(GetUserNotificationsFailureState(message: failure.message));
    }, (data) {
      if (isFirstTime) {
        notificationsModel = data;
      } else {
        notificationsModel?.data?.addAll(data.data!);
      }
      page++;
      gettingMoreNotifications = false;
      emit(GetUserNotificationsSuccessState());
    });
  }
}
