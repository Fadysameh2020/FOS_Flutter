import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BaseBodyWidget extends StatelessWidget {
  final List<Widget> children;
  final Widget appBar;

  const BaseBodyWidget(
      {required this.appBar, required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(25),
        appBar,
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 250.h),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: ListView(
                        children: children,
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
