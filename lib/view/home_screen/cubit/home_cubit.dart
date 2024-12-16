
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/carousel_model.dart';
import '../../../repositories/home_repository/home_repo.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;

  HomeCubit({required this.repo,})
      : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  final CarouselController carouselController = CarouselController();

  List<CarouselModel>? carousel;

  Future<void> getHomeCarouselData() async {
    emit(GetHomeCarouselDataLoadingState());
    var result = await repo.getHomeCarouselData();
    result.fold((failure) {
      emit(GetHomeCarouselDataFailureState(message: failure.message));
    }, (data) {
      carousel = data;
      emit(GetHomeCarouselDataSuccessState());
    });
  }


}
