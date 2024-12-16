import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class TabBarSelectableButton extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const TabBarSelectableButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  _TabBarSelectableButtonState createState() => _TabBarSelectableButtonState();
}

class _TabBarSelectableButtonState extends State<TabBarSelectableButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: widget.isSelected ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: widget.isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
