import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fos_app/repositories/settings_repository/settings_repo.dart';

import '../../core/networks/failures.dart';
import '../../core/networks/remote/api_constants.dart';
import '../../core/networks/remote/dio_helper.dart';
import '../../models/edit_profile_model.dart';

class SettingsRepoImpl implements SettingsRepo {
  @override
  Future<Either<Failure, String>> changePassword(
      {required String currentPassword, required String newPassword}) async {
    try {
      var response = await DioHelper.patchData(
        url: ApiConstants.changePasswordEndPoint,
        data: {
          "currentPassword": currentPassword,
          "newPassword": newPassword,
          "confirmPassword": newPassword,
        },
        sendToken: true,
      );
      if (response.data['success']) {
        return right(response.data['message']);
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      if (kDebugMode) {
        print("Error when changePassword $error");
      }
    }
    return left(ServerFailure(''));
  }

  @override
  Future<Either<Failure, Unit>> editProfile(
      {required EditProfileModel model}) async {
    try {
      var response = await DioHelper.patchData(
        url: ApiConstants.updateUserEndPoint,
        sendToken: true,
        data: FormData.fromMap(model.toJson()),
      );
      if (response.data['success']) {
        return right(unit);
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      if (kDebugMode) {
        print("Error when updating user data $error");
      }
    }
    return left(ServerFailure(''));
  }

  @override
  Future<Either<Failure, Unit>> deleteAccount({required password}) async {
    try {
      var response = await DioHelper.deleteData(
        url: ApiConstants.deleteUserEndPoint,
        sendToken: true,
        data: {
          'password': password,
        },
      );
      if (response.data['success']) {
        return right(unit);
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      if (kDebugMode) {
        print("Error when deleting user $error");
      }
    }
    return left(ServerFailure(''));
  }
}
