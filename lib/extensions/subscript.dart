import 'package:flutter/material.dart';
import 'package:flutter_tiptap_render/core/mark.dart';

var SubscriptExtension = Mark(
  name: 'subscript',
  addStyle: (node, mark) => const TextStyle(
    fontSize: 9,
    color: Colors.black87,
  ),
  wrapSpan: (child, node, mark) => WidgetSpan(
    alignment: PlaceholderAlignment.baseline,
    baseline: TextBaseline.alphabetic,
    child: Transform.translate(
      offset: const Offset(0, 6),
      child: RichText(text: child),
    ),
  ),
);
