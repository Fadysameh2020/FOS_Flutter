import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fos_app/core/app_localiziations/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_router/routes.dart';
import '../../../core/app_strings/app_strings.dart';
import '../../../core/assets_data/assets_data.dart';
import '../../../core/constants.dart';
import '../../../core/shared_components.dart';
import '../../../core/styles/text_styles.dart';
import '../../../core/values_manager.dart';
import '../../../reusable_widgets/FlutterMessage.dart';
import '../../../reusable_widgets/auth_back_button_widget.dart';
import '../../../reusable_widgets/default_app_bar.dart';
import '../../../reusable_widgets/default_button.dart';
import '../../../reusable_widgets/designed_form_field.dart';
import '../../../reusable_widgets/otp_reusable_widget.dart';
import 'cubit/forget_password_cubit.dart';

class ResetPasswordScreen extends StatelessWidget {
  final ForgetPasswordCubit cubit;

  const ResetPasswordScreen({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccessState) {
            FlutterMessage.show(
                message: AppStrings.passwordIsResetSuccessfully.tr(context));

            GoRouter.of(context).go(AppRouter.loginScreen);
          } else if (state is ResetPasswordFailureState) {
            FlutterMessage.show(message: state.message);
          }
        },
        builder: (context, state) {
          var cubit = ForgetPasswordCubit.get(context);

          return SafeArea(
            child: Scaffold(
              body: Form(
                key: cubit.resetPassKey,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: appPadding),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(20),
                                const AuthBackButtonWidget(),
                                const Gap(10),
                                LargeHeadlineText(
                                  text: AppStrings.resetPassword.tr(context),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p8,
                                  ),
                                  child: Text(
                                    AppStrings.enterNewPassword.tr(context),
                                    style: MyTextStyles.textStyle18Regular,
                                  ),
                                ),
                                Center(
                                    child: Image.asset(
                                        AssetsData.resetPasswordPng)),
                                const Gap(30),
                                DesignedFormField(
                                  function: () {
                                    cubit.changePasswordVisibility();
                                  },
                                  suffixIcon: Icon(cubit.suffix),
                                  isPassword: cubit.isPassword,
                                  controller: cubit.resetNewPasswordController,
                                  label: AppStrings.newPassword.tr(context),
                                  validator: (String? value) {
                                    if (cubit.resetNewPasswordController.text
                                        .isEmpty) {
                                      return AppStrings.passwordIsRequired
                                          .tr(context);
                                    }
                                    if (cubit.resetNewPasswordController.text
                                        .length <
                                        6) {
                                      return AppStrings.mustBeAtLeast6Digits
                                          .tr(context);
                                    }
                                  },
                                ),
                                Gap(20),
                                DesignedFormField(
                                  function: () {
                                    cubit.changePasswordConfirmedVisibility();
                                  },
                                  suffixIcon: Icon(cubit.suffixConfirm),
                                  isPassword: cubit.isPasswordConfirmed,
                                  controller:
                                  cubit.resetConfirmNewPasswordController,
                                  label:
                                  AppStrings.confirmNewPassword.tr(context),
                                  validator: (String? value) {
                                    if (cubit.resetConfirmNewPasswordController
                                        .text.isEmpty) {
                                      return AppStrings.passwordIsRequired
                                          .tr(context);
                                    }
                                    if (cubit.resetConfirmNewPasswordController
                                        .text !=
                                        cubit.resetNewPasswordController.text) {
                                      return AppStrings.passwordsDontMatch
                                          .tr(context);
                                    }
                                  },
                                ),
                                Gap(20),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: DefaultButton(
                              text: AppStrings.submit.tr(context),
                              loadingController:
                              cubit.resetPasswordLoadingController,
                              onTap: () {
                                if (cubit.resetPassKey.currentState!
                                    .validate()) {
                                  cubit.resetPassword();
                                }
                              }),
                        ),
                        Gap(50),
                      ],
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
