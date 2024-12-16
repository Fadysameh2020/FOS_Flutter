
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fos_app/view/home_screen/widget/home_carousel_widget.dart';
import 'package:gap/gap.dart';

import '../../core/constants.dart';
import '../../core/services/services_locator.dart';

import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()
        ..getHomeCarouselData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          return SafeArea(
            child: Scaffold(
              body: RefreshIndicator(
                color: primaryColor,
                backgroundColor: Colors.white,
                onRefresh: () async {
                  await Future.wait([
                    cubit.getHomeCarouselData(),
                  ]);
                },
                child: const SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Gap(20),
                      HomeCarouselWidget(),
                      Gap(20),
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
