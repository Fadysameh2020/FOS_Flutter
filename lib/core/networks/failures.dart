import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fos_app/core/app_localiziations/app_localizations.dart';

import '../../reusable_widgets/FlutterMessage.dart';
import '../../view/app_layout/cubit/app_cubit.dart';
import '../app_router/routes.dart';
import '../app_strings/app_strings.dart';

BuildContext? context =
    AppRouter.router.routerDelegate.navigatorKey.currentContext;

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(AppStrings.connectionTimeOut.tr(context!));
      case DioExceptionType.sendTimeout:
        return ServerFailure(AppStrings.sendTimeOut.tr(context!));
      case DioExceptionType.receiveTimeout:
        return ServerFailure(AppStrings.receiveTimeOut.tr(context!));
      case DioExceptionType.badCertificate:
        return ServerFailure(AppStrings.badCer.tr(context!));
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!.statusCode!, e.response!);
      case DioExceptionType.cancel:
        return ServerFailure(AppStrings.requestCancelled.tr(context!));
      case DioExceptionType.connectionError:
        return ServerFailure(AppStrings.noInternetConnection.tr(context!));
      case DioExceptionType.unknown:
        return ServerFailure(AppStrings.oppsThereWasAnError.tr(context!));
    }
  }

  factory ServerFailure.fromResponse(
      int statusCode, Response<dynamic>? response) {
    if (response == null) {
      return ServerFailure(AppStrings.somethingWentWrong.tr(context!));
    }

    if (statusCode == 500) {
      return ServerFailure(AppStrings.serverProblem.tr(context!));
    } else if (statusCode >= 400 && statusCode <= 404) {
      try {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          if (data.containsKey('message') && data.containsKey('success')) {
            final message = data['message'].toString();
            final success = data['success'] as bool;
            if (success == false) {
              if (message.toLowerCase().contains('expired')) {
                BuildContext context = AppRouter
                    .router.routerDelegate.navigatorKey.currentContext!;
                AppCubit.get(context).logOut(
                  context: context,
                );
                FlutterMessage.show(
                    message:
                    AppStrings.sessionExpiredPleaseLoginAgain.tr(context));
                return ServerFailure(
                    AppStrings.sessionExpiredPleaseLoginAgain.tr(context));
              } else {
                return ServerFailure(message);
              }
            }
          }
        }
        return ServerFailure(AppStrings.somethingWentWrong.tr(context!));
      } catch (e) {
        return ServerFailure(AppStrings.somethingWentWrong.tr(context!));
      }
    } else {
      return ServerFailure(AppStrings.somethingWentWrong.tr(context!));
    }
  }
}
