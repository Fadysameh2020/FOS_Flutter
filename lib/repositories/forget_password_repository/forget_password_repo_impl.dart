import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core/networks/failures.dart';
import '../../core/networks/remote/api_constants.dart';
import '../../core/networks/remote/dio_helper.dart';
import 'forget_password_repo.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  @override
  Future<Either<Failure, Unit>> forgetPassword({required String email}) async {
    try {
      var response = await DioHelper.postData(
          url: ApiConstants.forgetPasswordEndPoint,
          data: {
            "email": email,
          });
      if (response.data['success']) {
        return right(unit);
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      if (kDebugMode) {
        print("Error when forget password return response $error");
      }
    }
    return left(ServerFailure(''));
  }

  @override
  Future<Either<Failure, Unit>> verifyResetPassword(
      {required String email, required String code}) async {
    try {
      var response = await DioHelper.postData(
          url: ApiConstants.verifyResetPasswordEndPoint,
          data: {
            "email": email,
            "code": code,
          });
      if (response.data['success']) {
        return right(unit);
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      if (kDebugMode) {
        print("Error when forget password return response $error");
      }
    }
    return left(ServerFailure(''));
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(
      {required String email,
      required String newPassword,
      required String confirmNewPassword}) async {
    try {
      var response = await DioHelper.patchData(
        url: ApiConstants.resetPasswordEndPoint,
        data: {
          "email": email,
          "newPassword": newPassword,
          "confirmNewPassword": confirmNewPassword,
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
        print("Error when reset password $error");
      }
    }
    return left(ServerFailure(''));
  }
}
