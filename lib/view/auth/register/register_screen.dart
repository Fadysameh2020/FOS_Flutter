
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
import '../../../models/location_model.dart';
import '../../../reusable_widgets/FlutterMessage.dart';
import '../../../reusable_widgets/auth_back_button_widget.dart';
import '../../../reusable_widgets/custom_drop_down_widget.dart';
import '../../../reusable_widgets/default_app_bar.dart';
import '../../../reusable_widgets/default_button.dart';
import '../../../reusable_widgets/designed_form_field.dart';
import '../../../reusable_widgets/email_validator.dart';
import 'cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>()..getAllCountries(),
      child: Builder(
        builder: (context) {
          var cubit = RegisterCubit.get(context);

          return BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccessState) {
                FlutterMessage.show(
                    message: AppStrings.verificationCodeIsSentToYourEmailAddress
                        .tr(context));
                GoRouter.of(context).push(AppRouter.verifyEmailScreen,
                    extra: cubit.emailController.text);
              } else if (state is RegisterFailureState) {
                FlutterMessage.show(message: state?.message ?? '');
              }
            },
            builder: (context, state) {
              return SafeArea(
                child: Scaffold(
                  body: Padding(
                    padding: EdgeInsets.symmetric(horizontal: appPadding),
                    child: Form(
                      key: cubit.registerFormKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(20),
                            const AuthBackButtonWidget(),
                            const Gap(10),
                            LargeHeadlineText(
                              text: AppStrings.register.tr(context),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppPadding.p8,
                              ),
                              child: Text(
                                AppStrings.createYourNewAccount.tr(context),
                                style: MyTextStyles.textStyle18Regular,
                              ),
                            ),
                            Center(child: Image.asset(AssetsData.registerPng)),
                            const Gap(30),
                            DesignedFormField(
                              controller: cubit.firstNameController,
                              label: AppStrings.firstName.tr(context),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return AppStrings.pleaseEnterYourFirstName
                                      .tr(context);
                                }
                                return null;
                              },
                            ),
                            const Gap(15),
                            DesignedFormField(
                              controller: cubit.lastNameController,
                              label: AppStrings.lastName.tr(context),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return AppStrings.pleaseEnterYourLastName
                                      .tr(context);
                                }
                                return null;
                              },
                            ),
                            const Gap(15),
                            DesignedFormField(
                              controller: cubit.phoneController,
                              label: AppStrings.phoneNumber.tr(context),
                              type: TextInputType.number,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return AppStrings.pleaseEnterYourPhoneNumber
                                      .tr(context);
                                }
                                return null;
                              },
                            ),
                            const Gap(15),
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
                            CustomDropdownWidget<Country>(
                              hintText: AppStrings.selectCountry.tr(context),
                              display: (Country country) => country.name ?? '',
                              items: cubit.countries,
                              selectedItem: cubit.selectedCountry,
                              onChanged: (Country? country) {
                                cubit.selectedCountry = country;
                                cubit.emit(SelectCountryState());
                                cubit.getGovernoratesOfCountry(id: country?.id);
                              },
                            ),
                            const Gap(15),
                            if (cubit.selectedCountry != null) ...[
                              CustomDropdownWidget<Governorate>(
                                hintText: AppStrings.selectCity.tr(context),
                                display: (Governorate gov) => gov.name ?? '',
                                items: cubit.governorates,
                                selectedItem: cubit.selectedGovernorate,
                                onChanged: (Governorate? gov) {
                                  cubit.selectedGovernorate = gov;
                                  cubit.emit(SelectGovernorateState());
                                },
                              ),
                              const Gap(15),
                            ],
                            DesignedFormField(
                              controller: cubit.passwordController,
                              type: TextInputType.visiblePassword,
                              label: AppStrings.password.tr(context),
                              isPassword: true,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return AppStrings.pleaseEnterYourPassword
                                      .tr(context);
                                }
                                if (value!.length < 8) {
                                  return AppStrings.yourPasswordIsTooShort
                                      .tr(context);
                                }
                                return null;
                              },
                            ),
                            const Gap(15),
                            DesignedFormField(
                              controller: cubit.confirmPasswordController,
                              type: TextInputType.visiblePassword,
                              label: AppStrings.confirmPassword.tr(context),
                              isPassword: true,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return AppStrings.pleaseEnterYourPassword
                                      .tr(context);
                                }
                                if (cubit.confirmPasswordController.text !=
                                    cubit.passwordController.text) {
                                  return AppStrings.passwordsDontMatch
                                      .tr(context);
                                }
                                return null;
                              },
                            ),
                            const Gap(40),
                            Center(
                              child: DefaultButton(
                                text: AppStrings.signUp.tr(context),
                                loadingController:
                                    cubit.registerLoadingController,
                                onTap: () {
                                  if (cubit.registerFormKey.currentState!
                                      .validate()) {
                                    if (cubit.selectedGovernorate != null) {
                                      cubit.register();
                                    } else {
                                      FlutterMessage.show(
                                          message: AppStrings.pleaseSelectCity
                                              .tr(context));
                                    }
                                  }
                                },
                              ),
                            ),
                            const Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.alreadyHaveAnAccount.tr(context),
                                  style: MyTextStyles.textStyle14Medium,
                                ),
                                TextButton(
                                    onPressed: () {
                                      GoRouter.of(context).pop();
                                    },
                                    child: Text(
                                      AppStrings.login.tr(context),
                                      style: MyTextStyles.textStyle14Regular
                                          .copyWith(
                                        color: AppColors.greyTextColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                    )),
                              ],
                            ),
                            const Gap(20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
