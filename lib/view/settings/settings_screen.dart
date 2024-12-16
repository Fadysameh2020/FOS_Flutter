
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fos_app/core/app_localiziations/app_localizations.dart';
import 'package:fos_app/view/settings/widget/customer_support_bottom_sheet_child.dart';
import 'package:fos_app/view/settings/widget/language_bottom_sheet_child.dart';
import 'package:fos_app/view/settings/widget/settings_tile.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_router/routes.dart';
import '../../core/app_strings/app_strings.dart';
import '../../core/assets_data/assets_data.dart';
import '../../core/constants.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/icon_broken.dart';
import '../../core/styles/text_styles.dart';
import '../../core/values_manager.dart';
import '../../reusable_widgets/FlutterMessage.dart';
import '../../reusable_widgets/default_bottom_sheet.dart';
import '../../reusable_widgets/designed_form_field.dart';
import '../../reusable_widgets/reusable_pop_up_dialog.dart';
import '../app_layout/cubit/app_cubit.dart';
import '../edit_profile/cubit/edit_profile_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ChangeLocaleState) {
          AppCubit.get(context).getUserData().then((value) =>
              EditProfileCubit.get(context).emit(RefreshEditProfileCubit()));
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: RefreshIndicator(
            onRefresh: AppCubit.get(context).getUserData,
            color: primaryColor,
            backgroundColor: Colors.white,
            child: Scaffold(
              body: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(appPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),

                      Text(
                        AppStrings.settings.tr(context),
                        style: MyTextStyles.textStyle18Bold,
                      ),
                      const Gap(20),
                      if (isLoggedIn) ...[
                        Row(
                          children: [
                            SizedBox(
                              height: 90.h,
                              width: 90.h,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                child: userData?.image == null ||
                                        userData?.image == ''
                                    ? Container(
                                        width:
                                            130.w, // Adjust the width as needed
                                        height: 130
                                            .w, // Adjust the height as needed
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        child: Image.asset(AssetsData.userPng),
                                      )
                                    : FancyShimmerImage(
                                        imageUrl: userData?.image ?? '',
                                        boxFit: BoxFit.cover,
                                        height: double.infinity,
                                        width: double.infinity,
                                      ),
                              ),
                            ),
                            const Gap(20),
                            Text(
                              '${userData?.firstName ?? ''} ${userData?.lastName ?? ''}',
                              style: MyTextStyles.textStyle20Bold,
                            )
                          ],
                        ),
                        const Gap(20),
                        SettingsTile(
                          onPressed: () {
                            GoRouter.of(context)
                                .push(AppRouter.editProfileScreen);
                          },
                          text: AppStrings.editProfile.tr(context),
                          prefixIcon: Icon(
                            Icons.edit,
                            color: AppColors.modeColor,
                          ),
                        ),
                        const Gap(10),

                        SettingsTile(
                          onPressed: () {
                            GoRouter.of(context)
                                .push(AppRouter.changePasswordScreen);
                          },
                          text: AppStrings.changePassword.tr(context),
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: AppColors.modeColor,
                          ),
                        ),
                        const Gap(10),
                      ] else ...[
                        const Gap(20),
                        Image.asset(AssetsData.longLogo),
                        const Gap(40),
                        SettingsTile(
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.loginScreen);
                          },
                          text: AppStrings.login.tr(context),
                          prefixIcon: Icon(
                            Icons.login_outlined,
                            color: AppColors.modeColor,
                          ),
                        ),
                        const Gap(10),
                      ],

                      SettingsTile(
                        onPressed: () {
                          showOldDefaultBottomSheet(
                            context: context,
                            height: 190.h,
                            child: const LanguageBottomSheetChild(),
                          );
                        },
                        text: AppStrings.language.tr(context),
                        trailingText: AppCubit.get(context).locale == 'en'
                            ? AppStrings.english.tr(context)
                            : AppStrings.arabic.tr(context),
                        prefixIcon: Icon(
                          Icons.translate_outlined,
                          color: AppColors.modeColor,
                        ),
                      ),
                      const Gap(10),
                      SettingsTile(
                        onPressed: () {
                          GoRouter.of(context).push(
                            AppRouter.webViewScreen,
                            extra: termsAndConditionsLink,
                          );
                        },
                        text: AppStrings.termsAndConditions.tr(context),
                        prefixIcon: Icon(
                          IconBroken.Document,
                          color: AppColors.modeColor,
                        ),
                      ),
                      const Gap(10),
                      SettingsTile(
                        onPressed: () {
                          GoRouter.of(context).push(
                            AppRouter.webViewScreen,
                            extra: policyAndPrivacyLink,
                          );
                        },
                        text: AppStrings.policyAndPrivacy.tr(context),
                        prefixIcon: Icon(
                          Icons.privacy_tip_outlined,
                          color: AppColors.modeColor,
                        ),
                      ),
                      const Gap(10),
                      // SettingsTile(
                      //   onPressed: () {
                      //     showDefaultBottomSheet(
                      //       ctx: context,
                      //       height: 190.h,
                      //       child: const DarkModeBottomSheetChild(),
                      //     );
                      //   },
                      //   text: AppStrings.mode.tr(context),
                      //   trailingText: isDark
                      //       ? AppStrings.dark.tr(context)
                      //       : AppStrings.light.tr(context),
                      //   prefixIcon: Icon(
                      //     Icons.contrast_outlined,
                      //     color: AppColors.modeColor,
                      //   ),
                      // ),
                      // const Gap(10),
                      SettingsTile(
                        onPressed: () {
                          showOldDefaultBottomSheet(
                            context: context,
                            height: 190.h,
                            child: const CustomerSupportBottomSheetChild(),
                          );
                        },
                        text: AppStrings.customerSupport.tr(context),
                        prefixIcon: Icon(
                          Icons.question_mark,
                          color: AppColors.modeColor,
                        ),
                      ),
                      if (isLoggedIn) ...[
                        const Gap(10),
                        SettingsTile(
                          text: AppStrings.deleteAccount.tr(context),
                          prefixIcon: Icon(
                            IconBroken.Delete,
                            color: AppColors.modeColor,
                          ),
                          onPressed: () {
                            ReusablePopupDialog.show(
                              context: context,
                              title: AppStrings.deleteAccount.tr(context),
                              content: AppStrings
                                  .areYouSureYouWantToDeleteYourAccount
                                  .tr(context),
                              onPressed: () {
                                // Navigator.of(context).pop();
                                cubit.deleteAccountPassController.clear();
                                ReusablePopupDialog.show(
                                  context: context,
                                  title: AppStrings.deleteAccount.tr(context),
                                  content: AppStrings
                                      .enterYourAccountPasswordToVerifyDeletionOfYourAccount
                                      .tr(context),
                                  widget: Padding(
                                    padding:
                                        EdgeInsets.only(top: AppPadding.p12),
                                    child: DesignedFormField(
                                      isPassword: true,
                                      controller:
                                          cubit.deleteAccountPassController,
                                      label: AppStrings.password,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (cubit
                                            .deleteAccountPassController.text !=
                                        '') {
                                      cubit.deleteAccount();
                                    } else {
                                      FlutterMessage.show(
                                          message: AppStrings
                                              .typeYourPasswordPlease
                                              .tr(context));
                                    }
                                  },
                                  buttonText: AppStrings.confirm.tr(context),
                                );
                              },
                              buttonText: AppStrings.confirm.tr(context),
                            );
                          },
                        ),
                        const Gap(10),
                        SettingsTile(
                          onPressed: () {
                            AppCubit.get(context).logOut(context: context);
                          },
                          text: AppStrings.logout.tr(context),
                          prefixIcon: Icon(
                            Icons.logout_outlined,
                            color: AppColors.modeColor,
                          ),
                        ),
                      ],

                      const Gap(10),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     SocialMediaIconWidget(
                      //       svg: AssetsData.whatsappSvg,
                      //     ),
                      //     SocialMediaIconWidget(
                      //       svg: AssetsData.instagramSvg,
                      //     ),
                      //     SocialMediaIconWidget(
                      //       svg: AssetsData.tiktokSvg,
                      //     ),
                      //     SocialMediaIconWidget(
                      //       svg: AssetsData.facebookSvg,
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
