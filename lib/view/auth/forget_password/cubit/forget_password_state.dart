part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {}

class ForgetPasswordFailure extends ForgetPasswordState {}

class DidNotGetCodeLoading extends ForgetPasswordState {}

class VerifyPassCodeLoading extends ForgetPasswordState {}

class VerifyPassCodeSuccess extends ForgetPasswordState {}

class VerifyPassCodeFailure extends ForgetPasswordState {}

class ResetPasswordChangeVisibilityState extends ForgetPasswordState {}

class ResetConfirmPasswordChangeVisibilityState extends ForgetPasswordState {}

class ResetPasswordLoadingState extends ForgetPasswordState {}

class ResetPasswordSuccessState extends ForgetPasswordState {}

class ResetPasswordFailureState extends ForgetPasswordState {
  final String message;

  ResetPasswordFailureState({required this.message});
}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordSuccessState extends ForgetPasswordState {}

class ForgetPasswordFailureState extends ForgetPasswordState {
  final String message;

  ForgetPasswordFailureState({required this.message});
}

class VerifyResetPasswordCodeLoadingState extends ForgetPasswordState {}

class VerifyResetPasswordCodeSuccessState extends ForgetPasswordState {}

class VerifyResetPasswordCodeFailureState extends ForgetPasswordState {
  final String message;

  VerifyResetPasswordCodeFailureState({required this.message});
}
