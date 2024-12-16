import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../reusable_widgets/default_shimmer.dart';

class HomeCarouselLoadingWidget extends StatelessWidget {
  const HomeCarouselLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CarouselSliderController carouselController =
        CarouselSliderController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding),
      child: FadeIn(
        child: Column(
          children: <Widget>[
            CarouselSlider(
              items: const [
                DefaultShimmer(
                  height: double.infinity,
                  width: double.infinity,
                  radius: 20,
                ),
              ],
              controller: carouselController,
              options: CarouselOptions(
                initialPage: 0,
                autoPlay: true,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlayInterval: const Duration(seconds: 4),
                enlargeCenterPage: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
                scrollDirection: Axis.horizontal,
                scrollPhysics: const ClampingScrollPhysics(),
                aspectRatio: 2.0,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
