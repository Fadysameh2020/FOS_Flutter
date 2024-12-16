import 'package:dartz/dartz.dart';

import '../../core/networks/failures.dart';
import '../../models/carousel_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CarouselModel>>> getHomeCarouselData();
}
