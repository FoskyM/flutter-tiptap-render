import 'package:flutter/material.dart';
import 'package:tiptap_flutter/types/types.dart';

const baseFontSize = 12.0;

Map<int, double> _defaultHeadingSizes = {
  1: baseFontSize * 2.25,
  2: baseFontSize * 2,
  3: baseFontSize * 1.75,
  4: baseFontSize * 1.5,
  5: baseFontSize * 1.25,
  6: baseFontSize,
};

class Heading extends StatelessWidget {
  final int level;
  final List<dynamic>? content;
  final dynamic attrs;
  final FontWeight fontWeight;
  final Next next;

  const Heading({
    super.key,
    this.level = 1,
    this.content,
    this.attrs,
    this.fontWeight = FontWeight.bold,
    required this.next,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            top: (_defaultHeadingSizes[level]! / 2.0), bottom: 1),
        child: Text.rich(
          TextSpan(
            children: next(content),
          ),
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: _defaultHeadingSizes[level],
          ),
          textAlign: TextAlign.start,
        ));
  }
}
