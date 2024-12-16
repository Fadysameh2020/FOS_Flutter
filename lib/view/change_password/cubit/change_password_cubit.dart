import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../repositories/auth_repository/auth_repo.dart';
import '../../../repositories/settings_repository/settings_repo.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({
    required this.profileRepo,
    required this.authRepo,
  }) : super(ChangePasswordInitial());

  final SettingsRepo profileRepo;
  final AuthRepo authRepo;

  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  var changePassFormKey = GlobalKey<FormState>();
  var currentPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool changePasswordLoadingController = false;

  changePassword() async {
    changePasswordLoadingController = true;
    emit(ChangePasswordLoadingState());

    var result = await profileRepo.changePassword(
        currentPassword: currentPasswordController.text,
        newPassword: newPasswordController.text);
    result.fold((l) {
      changePasswordLoadingController = false;
      emit(ChangePasswordFailureState(message: l.message));
    }, (r) {
      changePasswordLoadingController = false;
      emit(ChangePasswordSuccessState(message: r));
    });
  }

  bool verifyEmailLoadingController = false;

  void setState() {
    emit(SetState());
  }
}
