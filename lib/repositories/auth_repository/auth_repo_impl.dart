import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../../core/constants.dart';
import '../../core/networks/failures.dart';
import '../../core/networks/remote/api_constants.dart';
import '../../core/networks/remote/dio_helper.dart';
import '../../models/location_model.dart';
import '../../models/register_model.dart';
import '../../models/user_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, UserModel>> getUserData() async {
    try {
      var response = await DioHelper.getData(
        url: ApiConstants.getUserDataEndPoint,
        sendToken: true,
      );
      if (response.data['success']) {
        saveToken(token: response.data['token']);
        return right(UserModel.fromJson(response.data['data']));
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      if (kDebugMode) {
        print("Error when get user data $error");
      }
    }
    return left(ServerFailure(''));
  }

  @override
  Future<Either<Failure, UserModel>> login(
      {required String email, required String password}) async {
    try {
      var response = await DioHelper.postData(
        url: ApiConstants.loginEndPoint,
        data: {
          "email": email,
          "password": password,
          "notificationToken": await FirebaseMessaging.instance.getToken(),
        },
      );

      if (response.data.containsKey('verify') && response.data['verify']) {
        return left(ServerFailure(response.data['message']));
      }
      if (response.data['success'] &&
          response.data.containsKey('data') &&
          response.data['data'] != null) {
        saveToken(token: response.data['token']);
        return right(UserModel.fromJson(response.data['data']));
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      if (kDebugMode) {
        print("Error when login $error");
      }
    }
    return left(ServerFailure(''));
  }

  @override
  Future<Either<Failure, Unit>> register({required RegisterModel model}) async {
    try {
      var response = await DioHelper.postData(
        url: ApiConstants.registerEndPoint,
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
        print("Error when register $error");
      }
    }
    return left(ServerFailure(''));
  }

  @override
  Future<Either<Failure, UserModel>> verifyEmail({
    required String email,
    required String code,
  }) async {
    try {
      var response = await DioHelper.postData(
        url: ApiConstants.verifyEmailEndPoint,
        data: {
          "email": email,
          "code": code,
          "notificationToken": await FirebaseMessaging.instance.getToken(),
        },
      );
      if (response.data['success']) {
        saveToken(token: response.data['token']);
        return right(UserModel.fromJson(response.data['data']));
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      if (kDebugMode) {
        print("Error when verifying email $error");
      }
    }
    return left(ServerFailure(''));
  }

  @override
  Future<Either<Failure, List<Country>>> getAllCountries() async {
    try {
      var response = await DioHelper.getData(
        url: ApiConstants.getAllCountriesEndPoint,
      );
      if (response.data['success']) {
        List<dynamic> parsedJson = response.data['data'] as List<dynamic>;
        List<Country> countries =
            parsedJson.map((e) => Country.fromJson(e)).toList();
        return right(countries);
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      if (kDebugMode) {
        print("Error when getting Countries $error");
      }
    }
    return left(ServerFailure(''));
  }

  @override
  Future<Either<Failure, List<Governorate>>> getGovernoratesOfCountry(
      {required id}) async {
    try {
      var response = await DioHelper.getData(
        url: ApiConstants.getGovernoratesOfCountry(id: id),
      );
      if (response.data['success']) {
        List<dynamic> parsedJson = response.data['data'] as List<dynamic>;
        List<Governorate> governorates =
            parsedJson.map((e) => Governorate.fromJson(e)).toList();
        return right(governorates);
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      if (kDebugMode) {
        print("Error when getting governorates of a country $id $error");
      }
    }
    return left(ServerFailure(''));
  }
}
