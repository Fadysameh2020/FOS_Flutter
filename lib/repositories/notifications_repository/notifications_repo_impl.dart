import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core/networks/failures.dart';
import '../../core/networks/remote/api_constants.dart';
import '../../core/networks/remote/dio_helper.dart';
import '../../models/notification_model.dart';
import 'notifications_repo.dart';

class NotificationsRepoImpl implements NotificationsRepo {
  @override
  Future<Either<Failure, PaginatedNotificationsModel>> getUserNotifications(
      {required int page}) async {
    try {
      var response = await DioHelper.getData(
        url: ApiConstants.getAllNotificationsEndPoint,
        sendToken: true,
        query: {
          "page": page,
          "perPage": 10,
        },
      );
      if (response.data['success']) {
        return right(PaginatedNotificationsModel.fromJson(response.data));
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      if (kDebugMode) {
        print("Error when get user notifications data $error");
      }
    }
    return left(ServerFailure(''));
  }
}
