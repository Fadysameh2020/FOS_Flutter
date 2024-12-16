import 'package:dartz/dartz.dart';

import '../../core/networks/failures.dart';
import '../../models/notification_model.dart';

abstract class NotificationsRepo {
  Future<Either<Failure, PaginatedNotificationsModel>> getUserNotifications(
      {required int page});
}
