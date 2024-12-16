part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class RefreshHomeCubit extends HomeState {}

class HomeCubitTimeChangeState extends HomeState {}

class ChangeSelectedWeekDay extends HomeState {}

class ChangeSelectedDay extends HomeState {}

class SearchControllerOnChangeState extends HomeState {}

class ClearSearchControllerState extends HomeState {}

class GetLocationState extends HomeState {}

class GetHomeCarouselDataLoadingState extends HomeState {}

class GetHomeCarouselDataSuccessState extends HomeState {}

class GetHomeCarouselDataFailureState extends HomeState {
  final String message;

  GetHomeCarouselDataFailureState({required this.message});
}

class GetHomeMyQrCodesLoadingState extends HomeState {}

class GetHomeMyQrCodesSuccessState extends HomeState {}

class GetHomeMyQrCodesFailureState extends HomeState {
  final String message;

  GetHomeMyQrCodesFailureState({required this.message});
}

class HomeToggleQrCodeEnabledStateLoadingState extends HomeState {}

class HomeToggleQrCodeEnabledStateSuccessState extends HomeState {}

class HomeToggleQrCodeEnabledStateFailureState extends HomeState {
  final String message;

  HomeToggleQrCodeEnabledStateFailureState({required this.message});
}
