import 'package:flutter/material.dart';

class Hr extends StatelessWidget {
  final Color color;
  final double height;
  final EdgeInsets padding;

  const Hr({
    super.key,
    this.color = Colors.black,
    this.height = 1.0,
    this.padding = const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 0.0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        color: color,
        height: height,
      ),
    );
  }
}
