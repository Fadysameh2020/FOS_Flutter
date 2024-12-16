part of 'notifications_cubit.dart';

@immutable
abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class GetUserNotificationsLoadingState extends NotificationsState {}

class GetUserNotificationsSuccessState extends NotificationsState {}

class GetUserNotificationsFailureState extends NotificationsState {
  final String message;
  GetUserNotificationsFailureState({required this.message});
}
