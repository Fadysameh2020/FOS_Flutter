
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fos_app/core/app_localiziations/app_localizations.dart';
import 'package:gap/gap.dart';

import '../../../core/app_strings/app_strings.dart';
import '../../../core/constants.dart';
import '../../../core/styles/icon_broken.dart';
import '../../../core/styles/text_styles.dart';
import '../../app_layout/cubit/app_cubit.dart';

class CustomerSupportBottomSheetChild extends StatefulWidget {
  const CustomerSupportBottomSheetChild({super.key});

  @override
  State<CustomerSupportBottomSheetChild> createState() =>
      _CustomerSupportBottomSheetChildState();
}

class _CustomerSupportBottomSheetChildState
    extends State<CustomerSupportBottomSheetChild> {
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
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  AppStrings.customerSupport.tr(context),
                  style: MyTextStyles.textStyle20Bold,
                ),
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                        ),
                        const Gap(15),
                        GestureDetector(
                          onTap: () {
                            AppCubit.get(context)
                                .launchCall(number: supportNumber);
                          },
                          child: Text(
                            supportNumber,
                            style: MyTextStyles.textStyle16Medium.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue.shade700,
                              color: Colors.blue.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Icon(
                          IconBroken.Message,
                        ),
                        const Gap(15),
                        GestureDetector(
                          onTap: () {
                            AppCubit.get(context)
                                .launchEmail(email: supportMail);
                          },
                          child: Text(
                            supportMail,
                            style: MyTextStyles.textStyle16Medium.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue.shade700,
                              color: Colors.blue.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(10),
            ],
          ),
        );
      },
    );
  }
}
