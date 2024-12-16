import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_options.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_layout/cubit/app_cubit.dart';
import '../cubit/home_cubit.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    var carouselController = CarouselSliderController();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return FadeIn(
          child: Column(
            children: <Widget>[
              CarouselSlider(
                items: cubit.carousel!.map((image) {
                  return GestureDetector(
                    onTap: () {
                      if (image.externalLink != null) {
                        launchUrl(Uri.parse(image.externalLink ?? ''));
                      }
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the radius as needed
                        child: CachedNetworkImage(
                          imageUrl: image.image ?? '',
                          fit: BoxFit.cover,
                          // progressIndicatorBuilder: (context, url, downloadProgress) =>
                          //     const CarouselLoadingWidget(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                controller: carouselController,
                options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  reverse: false,
                  // Disable auto-play
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
        );
      },
    );
  }
}
