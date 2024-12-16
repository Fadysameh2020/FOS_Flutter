
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_localiziations/app_localizations.dart';
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

class VerifyResetPasswordScreen extends StatelessWidget {
  final ForgetPasswordCubit cubit;

  const VerifyResetPasswordScreen({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is VerifyResetPasswordCodeSuccessState) {
            cubit.verificationCodeController.clear();
            cubit.resetNewPasswordController.clear();
            cubit.resetConfirmNewPasswordController.clear();
            GoRouter.of(context)
                .push(AppRouter.resetPasswordScreen, extra: cubit);
          }
          if (state is VerifyResetPasswordCodeFailureState) {
            FlutterMessage.show(message: state.message);
          }
        },
        builder: (context, state) {
          var cubit = ForgetPasswordCubit.get(context);

          return SafeArea(
            child: Scaffold(
              body: Form(
                key: cubit.verifyResetPassKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: appPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Gap(20),
                              const AuthBackButtonWidget(),
                              const Gap(10),
                              LargeHeadlineText(
                                text: AppStrings.enterOTP.tr(context),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p8,
                                ),
                                child: Text(
                                  AppStrings.a6DigitCodeHasBeenSentToYourEmail
                                      .tr(context),
                                  style: MyTextStyles.textStyle18Regular,
                                ),
                              ),
                              Center(
                                  child: Image.asset(
                                      AssetsData.verifyPasswordPng)),
                              const Gap(30),
                              OtpReusableWidget(
                                  directionality: TextDirection.ltr,
                                  controller: cubit.verificationCodeController),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: DefaultButton(
                            text: AppStrings.verify.tr(context),
                            loadingController:
                            cubit.verifyResetPasswordLoadingController,
                            onTap: () {
                              if (cubit.verifyResetPassKey.currentState!
                                  .validate()) {
                                cubit.verifyResetPasswordCode();
                              }
                            }),
                      ),
                      Gap(50),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
