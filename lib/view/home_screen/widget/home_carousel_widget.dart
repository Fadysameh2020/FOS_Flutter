import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../cubit/home_cubit.dart';
import 'home_carousel_slider.dart';
import 'home_carousel_loading_widget.dart';

class HomeCarouselWidget extends StatelessWidget {
  const HomeCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: appPadding),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: (cubit.carousel == null)
                  ? const HomeCarouselLoadingWidget()
                  : const HomeCarousel(),
            ),
          ),
        );
      },
    );
  }
}
