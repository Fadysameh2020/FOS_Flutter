sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class SetState extends ChangePasswordState {}

final class ChangePasswordLoadingState extends ChangePasswordState {}

final class ChangePasswordSuccessState extends ChangePasswordState {
  final String message;

  ChangePasswordSuccessState({required this.message});
}

final class ChangePasswordFailureState extends ChangePasswordState {
  final String message;

  ChangePasswordFailureState({required this.message});
}
