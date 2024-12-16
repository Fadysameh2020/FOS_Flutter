import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fos_app/core/app_localiziations/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_router/routes.dart';
import '../../../core/app_strings/app_strings.dart';
import '../../../core/assets_data/assets_data.dart';
import '../../../core/constants.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/shared_components.dart';
import '../../../core/styles/text_styles.dart';
import '../../../core/values_manager.dart';
import '../../../reusable_widgets/FlutterMessage.dart';
import '../../../reusable_widgets/auth_back_button_widget.dart';
import '../../../reusable_widgets/default_app_bar.dart';
import '../../../reusable_widgets/default_button.dart';
import '../../../reusable_widgets/designed_form_field.dart';
import '../../../reusable_widgets/email_validator.dart';
import 'cubit/forget_password_cubit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ForgetPasswordCubit>(),
      child: Builder(builder: (context) {
        var cubit = ForgetPasswordCubit.get(context);
        return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccessState) {
              FlutterMessage.show(
                  message: AppStrings.resetCodeSentToYourEmail.tr(context));
              GoRouter.of(context)
                  .push(AppRouter.verifyResetPasswordScreen, extra: cubit);
            } else if (state is ForgetPasswordFailureState) {
              FlutterMessage.show(message: state.message);
            }
          },
          builder: (context, state) {
            var cubit = ForgetPasswordCubit.get(context);
            return SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: appPadding),
                  child: Form(
                    key: cubit.forgetPassKey,
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
                                  text:
                                      AppStrings.forgotYourPassword.tr(context),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p8,
                                  ),
                                  child: Text(
                                    AppStrings.enterEmailAddress.tr(context),
                                    style: MyTextStyles.textStyle18Regular,
                                  ),
                                ),
                                Center(
                                    child: Image.asset(
                                        AssetsData.forgetPasswordPng)),
                                const Gap(30),
                                DesignedFormField(
                                  controller:
                                      cubit.forgotPasswordEmailController,
                                  type: TextInputType.emailAddress,
                                  label: AppStrings.email.tr(context),
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return AppStrings.pleaseEnterYourEmail
                                          .tr(context);
                                    }
                                    if (!EmailValidator.isEmailValid(value)) {
                                      return AppStrings.invalidEmail
                                          .tr(context);
                                    }
                                    return null;
                                  },
                                ),
                                const Gap(30),
                              ],
                            ),
                          ),
                        ),
                        DefaultButton(
                          text: AppStrings.sendCode.tr(context),
                          loadingController:
                              cubit.forgetPasswordLoadingController,
                          onTap: () {
                            if (cubit.forgetPassKey.currentState!.validate()) {
                              cubit.forgetPassword();
                            }
                          },
                        ),
                        Gap(50),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
