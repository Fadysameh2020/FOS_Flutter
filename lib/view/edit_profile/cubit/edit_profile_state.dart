part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState {}

class SettingsInitial extends EditProfileState {}

class RefreshEditProfileCubit extends EditProfileState {}

class EditProfileDataLoadingState extends EditProfileState {}

class EditProfileDataSuccessState extends EditProfileState {}

class SelectCountryState extends EditProfileState {}

class SelectGovernorateState extends EditProfileState {}

class EditProfileDataFailureState extends EditProfileState {
  final String message;

  EditProfileDataFailureState({required this.message});
}

class DeleteAccountLoadingState extends EditProfileState {}

class DeleteAccountSuccessState extends EditProfileState {}

class DeleteAccountFailureState extends EditProfileState {
  final String message;

  DeleteAccountFailureState({required this.message});
}

class GetSettingsAllCountriesLoadingState extends EditProfileState {}

class GetSettingsAllCountriesSuccessState extends EditProfileState {}

class GetSettingsAllCountriesFailureState extends EditProfileState {
  final String message;

  GetSettingsAllCountriesFailureState({required this.message});
}

class GetSettingsGovernoratesOfCountryLoadingState extends EditProfileState {}

class GetSettingsGovernoratesOfCountrySuccessState extends EditProfileState {}

class GetSettingsGovernoratesOfCountryFailureState extends EditProfileState {
  final String message;

  GetSettingsGovernoratesOfCountryFailureState({required this.message});
}
