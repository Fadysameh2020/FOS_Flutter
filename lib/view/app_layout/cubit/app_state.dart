part of 'app_cubit.dart';

@immutable
abstract class AppStates {}

class AppInitial extends AppStates {}

class ChangeAppColorModeState extends AppStates {}

class ChangeLocaleState extends AppStates {}

class ChangeAppModeState extends AppStates {}

class LogoutState extends AppStates {}

class ChangeBottomNavBar extends AppStates {}

class GetUserDataLoadingState extends AppStates {}

class GetUserDataSuccessState extends AppStates {}

class GetUserDataFailureState extends AppStates {
  final String message;

  GetUserDataFailureState({required this.message});
}

class DeleteAccountLoadingState extends AppStates {}

class DeleteAccountSuccessState extends AppStates {}

class DeleteAccountFailureState extends AppStates {
  final String message;

  DeleteAccountFailureState({required this.message});
}
