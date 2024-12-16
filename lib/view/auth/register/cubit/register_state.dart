part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RefreshRegisterState extends RegisterState {}

class SelectCountryState extends RegisterState {}

class SelectGovernorateState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterFailureState extends RegisterState {
  final String message;

  RegisterFailureState({required this.message});
}

class GetAllCountriesLoadingState extends RegisterState {}

class GetAllCountriesSuccessState extends RegisterState {}

class GetAllCountriesFailureState extends RegisterState {
  final String message;

  GetAllCountriesFailureState({required this.message});
}

class GetGovernoratesOfCountryLoadingState extends RegisterState {}

class GetGovernoratesOfCountrySuccessState extends RegisterState {}

class GetGovernoratesOfCountryFailureState extends RegisterState {
  final String message;

  GetGovernoratesOfCountryFailureState({required this.message});
}
