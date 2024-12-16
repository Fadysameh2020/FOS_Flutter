import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/styles/text_styles.dart';

class CounterWidget extends StatelessWidget {
  final int currentQuantity;
  final int minQuantity;
  final int maxQuantity;
  final Function(int) onCounterChanged;

  const CounterWidget({
    required this.currentQuantity,
    required this.minQuantity,
    required this.maxQuantity,
    required this.onCounterChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              color: currentQuantity > minQuantity ? Colors.black : Colors.grey,
              size: 15,
            ),
            onPressed: currentQuantity > minQuantity
                ? () {
                    onCounterChanged(currentQuantity - 1);
                  }
                : null,
          ),
          Text(
            currentQuantity.toString(),
            style: MyTextStyles.textStyle14Medium,
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: currentQuantity < maxQuantity ? Colors.black : Colors.grey,
              size: 15,
            ),
            onPressed: currentQuantity < maxQuantity
                ? () {
                    onCounterChanged(currentQuantity + 1);
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
