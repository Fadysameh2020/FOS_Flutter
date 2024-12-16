
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fos_app/core/app_localiziations/app_localizations.dart';
import 'package:gap/gap.dart';

import '../../../core/app_strings/app_strings.dart';
import '../../../core/styles/text_styles.dart';
import '../../../reusable_widgets/radio_button_and_text_widget.dart';
import '../../app_layout/cubit/app_cubit.dart';

class LanguageBottomSheetChild extends StatefulWidget {
  const LanguageBottomSheetChild({super.key});

  @override
  State<LanguageBottomSheetChild> createState() =>
      _LanguageBottomSheetChildState();
}

class _LanguageBottomSheetChildState extends State<LanguageBottomSheetChild> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  AppStrings.changeLanguage.tr(context),
                  style: MyTextStyles.textStyle20Bold,
                ),
              ),
              const Gap(10),
              RadioButtonWithTextWidget(
                text: AppStrings.english.tr(context),
                value: 'en',
                selectedValue: AppCubit.get(context).locale,
                onChanged: (value) async {
                  await AppCubit.get(context).changeLocale(languageCode: 'en');
                  Navigator.pop(context);
                },
              ),
              const Gap(10),
              RadioButtonWithTextWidget(
                text: AppStrings.arabic.tr(context),
                value: 'ar',
                selectedValue: AppCubit.get(context).locale,
                onChanged: (value) async {
                  await AppCubit.get(context).changeLocale(languageCode: 'ar');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
