import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../core/styles/text_styles.dart';

class OtpReusableWidget extends StatelessWidget {
  final int? numLength;
  final TextDirection? directionality;
  final TextEditingController controller;
  final TextInputType? type;

  const OtpReusableWidget({
    super.key,
    this.numLength,
    required this.controller,
    this.directionality,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      child: Directionality(
        textDirection: directionality ?? TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 2,
          ),
          child: PinCodeTextField(
            enableActiveFill: true,
            appContext: context,
            autoDisposeControllers: false,
            length: numLength ?? 6,
            blinkWhenObscuring: true,
            animationType: AnimationType.fade,
            hintStyle: MyTextStyles.textStyle18Bold,
            // validator: (v) {
            //   if (v!.length < (numLength ?? 6)) {
            //     return AppStrings.incompleteCode.tr(context);
            //   }
            // },
            textStyle: MyTextStyles.textStyle18Regular,
            keyboardType: type ?? TextInputType.text,
            // For general text input, including Arabic

            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(10),
              borderWidth: 2,
              errorBorderColor: const Color(0xffE3E5E8),
              activeColor: const Color(0xffE3E5E8),
              disabledColor: const Color(0xffE3E5E8),
              inactiveColor: const Color(0xffE3E5E8),
              inactiveFillColor: const Color(0xffE3E5E8),
              selectedFillColor: const Color(0xffE3E5E8),
              selectedColor: const Color(0xffE3E5E8),
              activeFillColor: const Color(0xffE3E5E8),
              fieldHeight: numLength == 2 ? 40.h : 33.h,
              // Adjust height
              fieldWidth: numLength == 2 ? 50.w : 37.w,
              // Adjust width
              fieldOuterPadding:
                  EdgeInsets.all(1.w), // Add pa  dding around fields
            ),
            cursorColor: Colors.black,
            animationDuration: const Duration(milliseconds: 300),
            controller: controller,
            mainAxisAlignment: MainAxisAlignment.center, // Center the fields
          ),
        ),
      ),
    );
  }
}
