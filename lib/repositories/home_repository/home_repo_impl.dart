import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../core/networks/failures.dart';
import '../../core/networks/remote/api_constants.dart';
import '../../core/networks/remote/dio_helper.dart';
import '../../models/carousel_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<CarouselModel>>> getHomeCarouselData() async {
    try {
      var response = await DioHelper.getData(
        url: ApiConstants.getHomeCarouselDataEndPoint,
      );
      if (response.data['success']) {
        List<dynamic> list = response.data['data'] as List<dynamic>;
        List<CarouselModel> data =
            list.map((e) => CarouselModel.fromJson(e)).toList();
        return right(data);
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      if (kDebugMode) {
        print("Error when get Home carousel data $error");
      }
    }
    return left(ServerFailure(''));
  }
}
