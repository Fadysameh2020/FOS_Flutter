
import 'package:fos_app/models/pagination_model.dart';

class NotificationModel {
  final String? id;
  final String? title;
  final String? body;
  final String? image;
  final DateTime? dateTime;
  final String? caseData;
  final String? info;

  NotificationModel({
    this.id,
    this.title,
    this.body,
    this.image,
    this.dateTime,
    this.caseData,
    this.info,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['_id'],
      body: json['body'],
      title: json['title'],
      image: json['image'],
      dateTime:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      caseData: json['case'],
      info: json['info'],
    );
  }
}

class PaginatedNotificationsModel {
  PaginationModel? pagination;
  final List<NotificationModel>? data;

  PaginatedNotificationsModel({
    this.pagination,
    this.data,
  });

  factory PaginatedNotificationsModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List<dynamic>;
    List<NotificationModel> notifications = dataList
        .map((notification) => NotificationModel.fromJson(notification))
        .toList();

    return PaginatedNotificationsModel(
      pagination: PaginationModel.fromJson(json['pagination']),
      data: notifications,
    );
  }
}
