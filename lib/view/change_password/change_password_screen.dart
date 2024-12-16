
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fos_app/core/app_localiziations/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_router/routes.dart';
import '../../core/app_strings/app_strings.dart';
import '../../core/assets_data/assets_data.dart';
import '../../core/constants.dart';
import '../../core/services/services_locator.dart';
import '../../core/shared_components.dart';

import '../../reusable_widgets/default_app_bar.dart';
import '../../reusable_widgets/default_button.dart';
import '../../reusable_widgets/designed_form_field.dart';
import 'cubit/change_password_cubit.dart';
import 'cubit/change_password_state.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        skipBackButton: false,
        title: AppStrings.changePassword.tr(context),
        context: context,
      ),
      body: BlocProvider(
        create: (context) => sl<ChangePasswordCubit>(),
        child: Builder(builder: (context) {
          ChangePasswordCubit cubit = ChangePasswordCubit.get(context);

          return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
            listener: (context, state) {
              if (state is ChangePasswordSuccessState) {
                showToast(state: ToastStates.SUCCESS, text: state.message);
                Navigator.pop(context);
                GoRouter.of(context).push(AppRouter.loginScreen);
              }
              if (state is ChangePasswordFailureState) {
                showToast(state: ToastStates.ERROR, text: state.message);
              }
            },
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: appPadding),
                child: Form(
                  key: cubit.changePassFormKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Gap(20),
                              Center(
                                  child: Image.asset(
                                AssetsData.forgetPasswordPng,
                                height: 250,
                              )),
                              const Gap(30),
                              DesignedFormField(
                                controller: cubit.currentPasswordController,
                                label: AppStrings.currentPassword.tr(context),
                                type: TextInputType.text,
                                isPassword: true,
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return AppStrings.cantBeEmpty.tr(context);
                                  }
                                },
                              ),
                              const Gap(15),
                              DesignedFormField(
                                controller: cubit.newPasswordController,
                                label: AppStrings.newPassword.tr(context),
                                type: TextInputType.text,
                                isPassword: true,
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return AppStrings.cantBeEmpty.tr(context);
                                  }
                                },
                              ),
                              const Gap(15),
                              DesignedFormField(
                                controller: cubit.confirmPasswordController,
                                label: AppStrings.confirmPassword.tr(context),
                                type: TextInputType.text,
                                isPassword: true,
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return AppStrings.cantBeEmpty.tr(context);
                                  }
                                  if (cubit.newPasswordController.text !=
                                      cubit.confirmPasswordController.text) {
                                    return AppStrings.passwordsDontMatch
                                        .tr(context);
                                  }
                                },
                              ),
                              const Gap(30),
                            ],
                          ),
                        ),
                      ),
                      DefaultButton(
                        text: AppStrings.submit.tr(context),
                        loadingController:
                            cubit.changePasswordLoadingController,
                        onTap: () {
                          if (cubit.changePassFormKey.currentState!
                              .validate()) {
                            cubit.changePassword();
                          }
                        },
                      ),
                      Gap(50),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
