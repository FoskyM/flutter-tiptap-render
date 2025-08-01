import 'package:flutter/material.dart';
import 'package:flutter_tiptap_render/core/node.dart';

var BlockquoteExtension = Node(
  name: "blockquote",
  group: "block",
  content: "block+",
  renderer: (node, {next, attributes, extension, parentNode}) => WidgetSpan(
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F5),
        border: Border(
          left: BorderSide(
            color: Color(0xFFBDBDBD),
            width: 4,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: (node['content'] ?? []).map<Widget>((child) {
          final span = next?.call(child);
          if (span is InlineSpan) {
            return Text.rich(span);
          } else if (span is Widget) {
            return span;
          } else {
            return const SizedBox.shrink();
          }
        }).toList(),
      ),
    ),
  ),
);
