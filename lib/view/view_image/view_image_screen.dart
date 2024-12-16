import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/styles/app_colors.dart';
import '../../core/values_manager.dart';
import '../../reusable_widgets/default_app_bar.dart';

class ViewImageScreen extends StatefulWidget {
  final List<dynamic>? images;
  final int index;
  final String? caption;

  const ViewImageScreen({
    super.key,
    this.images,
    required this.index,
    this.caption,
  });

  @override
  State<ViewImageScreen> createState() => _ViewImageScreenState();
}

class _ViewImageScreenState extends State<ViewImageScreen> {
  _ViewImageScreenState();

  late PageController pageController;
  late int currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: widget.index);
    currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        context: context,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomRight,
        children: [
          SvgPicture.asset(
            '',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.images?.length ?? 0,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return ExtendedImage.network(
                      widget.images?[index],
                      fit: BoxFit.contain,
                      cache: true,
                      // You can set the gesture mode here
                      mode: ExtendedImageMode.gesture,
                      initGestureConfigHandler: (state) {
                        return GestureConfig(
                          minScale: 0.8,
                          maxScale: 3.0,
                        );
                      },
                      // Optionally add loading and error handling
                      loadStateChanged: (state) {
                        switch (state.extendedImageLoadState) {
                          case LoadState.loading:
                            return const Center(
                                child: CircularProgressIndicator());
                          case LoadState.completed:
                            return null; // The image will be displayed
                          case LoadState.failed:
                            return const Center(
                                child: Text('Failed to load image'));
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: AppHeight.p30,
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                child: Text(
                  "${widget.images?.length ?? 0}/${currentIndex + 1}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
