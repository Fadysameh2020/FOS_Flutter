import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/icon_broken.dart';
import '../../../../repositories/forget_password_repository/forget_password_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo repo;

  ForgetPasswordCubit({required this.repo}) : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  bool forgetPasswordLoadingController = false;
  bool verifyResetPasswordLoadingController = false;
  bool resetPasswordLoadingController = false;
  var forgetPassKey = GlobalKey<FormState>();
  var verifyResetPassKey = GlobalKey<FormState>();
  var resetPassKey = GlobalKey<FormState>();

  IconData suffix = IconBroken.Hide;
  IconData suffixConfirm = IconBroken.Hide;
  bool isPassword = true;
  bool isPasswordConfirmed = true;
  var forgotPasswordEmailController = TextEditingController();
  var verificationCodeController = TextEditingController();
  var resetNewPasswordController = TextEditingController();
  var resetConfirmNewPasswordController = TextEditingController();

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? IconBroken.Hide : IconBroken.Show;
    emit(ResetPasswordChangeVisibilityState());
  }

  void changePasswordConfirmedVisibility() {
    isPasswordConfirmed = !isPasswordConfirmed;
    suffixConfirm = isPasswordConfirmed ? IconBroken.Hide : IconBroken.Show;
    emit(ResetConfirmPasswordChangeVisibilityState());
  }

  void clearControllers() {
    forgotPasswordEmailController.clear();
    verificationCodeController.clear();
    resetNewPasswordController.clear();
    resetConfirmNewPasswordController.clear();
  }

  Future<void> forgetPassword() async {
    forgetPasswordLoadingController = true;
    emit(ForgetPasswordLoadingState());
    var result = await repo.forgetPassword(
      email: forgotPasswordEmailController.text,
    );
    result.fold((l) {
      forgetPasswordLoadingController = false;

      emit(ForgetPasswordFailureState(message: l.message));
    }, (r) {
      forgetPasswordLoadingController = false;

      emit(ForgetPasswordSuccessState());
    });
  }

  Future<void> verifyResetPasswordCode() async {
    verifyResetPasswordLoadingController = true;
    emit(VerifyResetPasswordCodeLoadingState());
    var result = await repo.verifyResetPassword(
        email: forgotPasswordEmailController.text,
        code: verificationCodeController.text);
    result.fold((failure) {
      verifyResetPasswordLoadingController = false;

      emit(VerifyResetPasswordCodeFailureState(message: failure.message));
    }, (data) {
      verifyResetPasswordLoadingController = false;

      emit(VerifyResetPasswordCodeSuccessState());
    });
  }

  Future<void> resetPassword() async {
    resetPasswordLoadingController = true;
    emit(ResetPasswordLoadingState());
    var result = await repo.resetPassword(
      email: forgotPasswordEmailController.text,
      newPassword: resetNewPasswordController.text,
      confirmNewPassword: resetConfirmNewPasswordController.text,
    );

    result.fold((failure) {
      resetPasswordLoadingController = false;
      emit(ResetPasswordFailureState(message: failure.message));
    }, (data) {
      resetPasswordLoadingController = false;
      emit(ResetPasswordSuccessState());
    });
  }
}
