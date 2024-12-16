part of 'verify_email_cubit.dart';

@immutable
abstract class VerifyEmailState {}

class VerifyEmailInitial extends VerifyEmailState {}

class VerifyAccountLoadingState extends VerifyEmailState {}

class VerifyAccountSuccessState extends VerifyEmailState {}

class VerifyAccountFailureState extends VerifyEmailState {
  final String? message;

  VerifyAccountFailureState({this.message});
}
