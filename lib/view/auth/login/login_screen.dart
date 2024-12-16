
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
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/text_styles.dart';
import '../../../core/values_manager.dart';
import '../../../reusable_widgets/FlutterMessage.dart';
import '../../../reusable_widgets/auth_back_button_widget.dart';
import '../../../reusable_widgets/default_button.dart';
import '../../../reusable_widgets/designed_form_field.dart';
import '../../../reusable_widgets/email_validator.dart';
import '../../app_layout/cubit/app_cubit.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: DefaultAppBar(context: context),
        body: BlocProvider(
          create: (context) => sl<LoginCubit>(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                FlutterMessage.show(
                    message: AppStrings.loggedInSuccessfully.tr(context));
                AppCubit.get(context)
                    .changeBottomNavBar(index: 0, context: context);
                GoRouter.of(context).go(AppRouter.splashScreen);
              } else if (state is LoginFailureState) {
                if (state.message ==
                    "Verification code is sent to your email address") {
                  FlutterMessage.show(message: state?.message ?? '');
                  GoRouter.of(context).push(AppRouter.verifyEmailScreen,
                      extra: LoginCubit.get(context)
                          .emailController
                          .text); //logic error
                } else {
                  FlutterMessage.show(message: state?.message ?? '');
                }
              }
            },
            builder: (context, state) {
              var cubit = LoginCubit.get(context);
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: appPadding),
                child: Form(
                  key: cubit.loginFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(20),
                        AuthBackButtonWidget(),
                        const Gap(20),
                        LargeHeadlineText(
                          text: AppStrings.welcomeBack.tr(context),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p8,
                          ),
                          child: Text(
                            AppStrings.loginToYourAccount.tr(context),
                            style: MyTextStyles.textStyle18Regular,
                          ),
                        ),
                        Center(child: Image.asset(AssetsData.loginPng)),
                        const Gap(30),
                        DesignedFormField(
                          controller: cubit.emailController,
                          type: TextInputType.emailAddress,
                          label: AppStrings.email.tr(context),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return AppStrings.pleaseEnterYourEmail
                                  .tr(context);
                            }
                            if (!EmailValidator.isEmailValid(value)) {
                              return AppStrings.invalidEmail.tr(context);
                            }
                            return null;
                          },
                        ),
                        const Gap(15),
                        DesignedFormField(
                          controller: cubit.passwordController,
                          type: TextInputType.visiblePassword,
                          label: AppStrings.password.tr(context),
                          isPassword: cubit.isPassword,
                          suffixIcon: Icon(cubit.suffix),
                          function: () {
                            cubit.changePasswordVisibility();
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return AppStrings.pleaseEnterYourPassword
                                  .tr(context);
                            }
                            return null;
                          },
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: TextButton(
                            onPressed: () {
                              GoRouter.of(context)
                                  .push(AppRouter.forgetPasswordScreen);
                            },
                            child: Text(
                              AppStrings.forgotPassword.tr(context),
                              style: MyTextStyles.textStyle12Medium,
                            ),
                          ),
                        ),
                        const Gap(70),
                        Center(
                          child: DefaultButton(
                            text: AppStrings.login.tr(context),
                            loadingController: cubit.loginLoadingController,
                            onTap: () {
                              if (cubit.loginFormKey.currentState!.validate()) {
                                cubit.login();
                              }
                            },
                          ),
                        ),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.dontHaveAnAccount.tr(context),
                              style: MyTextStyles.textStyle14Medium,
                            ),
                            TextButton(
                                onPressed: () {
                                  GoRouter.of(context)
                                      .push(AppRouter.registerScreen);
                                },
                                child: Text(
                                  AppStrings.createAccount.tr(context),
                                  style:
                                      MyTextStyles.textStyle14Regular.copyWith(
                                    color: AppColors.greyTextColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
