import 'package:flutter/material.dart';

import '../core/constants.dart';

class YellowCircleWidget extends StatelessWidget {
  const YellowCircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 18.0, // Diameter of the circle
        height: 18.0,
        decoration: BoxDecoration(
          color: Colors.transparent, // Transparent background
          shape: BoxShape.circle,
          border: Border.all(
            color: primaryColor, // Color of the border
            width: 5.0, // Thickness of the border
          ),
        ),
      ),
    );
  }
}
