
import 'package:flutter/material.dart';
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
import '../../../reusable_widgets/otp_reusable_widget.dart';
import '../../app_layout/cubit/app_cubit.dart';
import 'cubit/verify_email_cubit.dart';

class VerifyEmailScreen extends StatelessWidget {
  final String? email;

  const VerifyEmailScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VerifyEmailCubit>(),
      child: BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
        listener: (context, state) {
          if (state is VerifyAccountSuccessState) {
            FlutterMessage.show(
                message: AppStrings.emailVerifiedSuccessfully.tr(context));
            GoRouter.of(context).go(AppRouter.splashScreen);
          }
        },
        builder: (context, state) {
          var cubit = VerifyEmailCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: Form(
                key: cubit.verifyEmailFormKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: appPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Gap(20),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: const AuthBackButtonWidget()),
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
                                cubit.verifyEmailLoadingController,
                            onTap: () {
                              if (cubit.verifyEmailFormKey.currentState!
                                  .validate()) {
                                cubit.verifyEmail(email: email);
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
