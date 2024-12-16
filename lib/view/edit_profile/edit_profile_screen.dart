
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fos_app/core/app_localiziations/app_localizations.dart';
import 'package:fos_app/view/edit_profile/widget/edit_pic_profile_widget.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_strings/app_strings.dart';
import '../../core/constants.dart';
import '../../core/services/services_locator.dart';

import '../../models/location_model.dart';
import '../../reusable_widgets/FlutterMessage.dart';
import '../../reusable_widgets/custom_drop_down_widget.dart';
import '../../reusable_widgets/default_app_bar.dart';
import '../../reusable_widgets/default_button.dart';
import '../../reusable_widgets/default_loading_widget.dart';
import '../../reusable_widgets/designed_form_field.dart';
import '../app_layout/cubit/app_cubit.dart';
import 'cubit/edit_profile_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<EditProfileCubit>()..handleEditProfileDetails(context: context),
      child: Builder(builder: (context) {
        var cubit = EditProfileCubit.get(context);
        return BlocConsumer<EditProfileCubit, EditProfileState>(
          listener: (context, state) {
            if (state is EditProfileDataFailureState) {
              FlutterMessage.show(message: state.message);
            }

            if (state is EditProfileDataSuccessState) {
              FlutterMessage.show(
                  message: AppStrings.profileUpdatedSuccessfully.tr(context));
              AppCubit.get(context).getUserData();
              GoRouter.of(context).pop();
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: DefaultAppBar(
                title: AppStrings.editProfile.tr(context),
                context: context,
              ),
              body: !cubit.handledEditAccountPage
                  ? Center(
                      child: DefaultLoadingWidget(),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: appPadding),
                      child: Form(
                        key: cubit.editProfileKey,
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView(
                                children: [
                                  const Gap(30),
                                  const EditPicProfileWidget(),
                                  const Gap(20),
                                  DesignedFormField(
                                    label: AppStrings.firstName.tr(context),
                                    controller: cubit.firstNameController,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return AppStrings
                                            .pleaseEnterYourFirstName
                                            .tr(context);
                                      }
                                    },
                                  ),
                                  const Gap(15),
                                  DesignedFormField(
                                    label: AppStrings.lastName.tr(context),
                                    controller: cubit.lastNameController,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return AppStrings
                                            .pleaseEnterYourLastName
                                            .tr(context);
                                      }
                                    },
                                  ),
                                  const Gap(15),
                                  DesignedFormField(
                                    label: AppStrings.email.tr(context),
                                    controller: cubit.emailController,
                                    enabled: false,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return AppStrings.pleaseEnterYourEmail
                                            .tr(context);
                                      }
                                    },
                                  ),
                                  const Gap(15),
                                  CustomDropdownWidget<Country>(
                                    hintText:
                                        AppStrings.selectCountry.tr(context),
                                    display: (Country country) =>
                                        country.name ?? '',
                                    items: cubit.countries,
                                    selectedItem: cubit.selectedCountry,
                                    onChanged: (Country? country) {
                                      cubit.selectedCountry = country;
                                      cubit.emit(SelectCountryState());
                                      cubit.getGovernoratesOfCountry(
                                          id: country?.id);
                                    },
                                  ),
                                  const Gap(15),
                                  CustomDropdownWidget<Governorate>(
                                    hintText: AppStrings.selectCity.tr(context),
                                    display: (Governorate gov) =>
                                        gov.name ?? '',
                                    items: cubit.governorates,
                                    selectedItem: cubit.selectedGovernorate,
                                    onChanged: (Governorate? gov) {
                                      cubit.selectedGovernorate = gov;
                                      cubit.emit(SelectGovernorateState());
                                    },
                                  ),
                                  const Gap(15),
                                  DesignedFormField(
                                    label: AppStrings.phoneNumber.tr(context),
                                    controller: cubit.phoneController,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return AppStrings
                                            .pleaseEnterYourPhoneNumber
                                            .tr(context);
                                      }
                                    },
                                  ),
                                  // const Gap(15),
                                  // Align(
                                  //   alignment: Alignment.centerRight,
                                  //   child: TextButton(
                                  //     child: Text(
                                  //       AppStrings.deleteAccount.tr(context),
                                  //       style: MyTextStyles.textStyle14Medium
                                  //           .copyWith(
                                  //         decoration: TextDecoration.underline,
                                  //       ),
                                  //     ),
                                  //     onPressed: () {
                                  //       ReusablePopupDialog.show(
                                  //         context: context,
                                  //         title: AppStrings.deleteAccount
                                  //             .tr(context),
                                  //         content: AppStrings
                                  //             .areYouSureYouWantToDeleteYourAccount
                                  //             .tr(context),
                                  //         onPressed: () {
                                  //           // Navigator.of(context).pop();
                                  //           cubit.deleteAccountPassController
                                  //               .clear();
                                  //           ReusablePopupDialog.show(
                                  //             disablePopAfterConfirm: true,
                                  //             context: context,
                                  //             title: AppStrings.deleteAccount
                                  //                 .tr(context),
                                  //             content: AppStrings
                                  //                 .enterYourAccountPasswordToVerifyDeletionOfYourAccount
                                  //                 .tr(context),
                                  //             widget: Padding(
                                  //               padding: EdgeInsets.only(
                                  //                   top: AppPadding.p12),
                                  //               child: DesignedFormField(
                                  //                 isPassword: true,
                                  //                 controller: cubit
                                  //                     .deleteAccountPassController,
                                  //                 label: AppStrings.password,
                                  //               ),
                                  //             ),
                                  //             onPressed: () {
                                  //               if (cubit
                                  //                       .deleteAccountPassController
                                  //                       .text !=
                                  //                   '') {
                                  //                 cubit.deleteAccount();
                                  //               } else {
                                  //                 FlutterMessage.show(
                                  //                     message: AppStrings
                                  //                         .typeYourPasswordPlease
                                  //                         .tr(context));
                                  //               }
                                  //             },
                                  //             buttonText: AppStrings.confirm
                                  //                 .tr(context),
                                  //           );
                                  //         },
                                  //         buttonText:
                                  //             AppStrings.confirm.tr(context),
                                  //       );
                                  //     },
                                  //   ),
                                  // ),
                                  // const Gap(15),
                                ],
                              ),
                            ),
                            DefaultButton(
                                text: AppStrings.submit.tr(context),
                                loadingController:
                                    state is EditProfileDataLoadingState,
                                onTap: () {
                                  if (cubit.editProfileKey.currentState!
                                      .validate()) {
                                    cubit.editProfile();
                                  }
                                }),
                            const Gap(40),
                          ],
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
