import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';
import 'package:tiptap_flutter/extensions/extensions.dart';

var HeadingExtension = Node(
    name: "heading",
    content: "inline*",
    group: "block",
    renderer: (node, {next}) => HeadingWidget(node, next: next));

const baseFontSize = 12.0;

Map<int, double> _defaultHeadingSizes = {
  1: baseFontSize * 2.25,
  2: baseFontSize * 2,
  3: baseFontSize * 1.75,
  4: baseFontSize * 1.5,
  5: baseFontSize * 1.25,
  6: baseFontSize,
};

class HeadingWidget extends TiptapBlockRenderer {
  const HeadingWidget(
    super.node, {
    super.key,
    super.next,
  });

  @override
  Widget build(BuildContext context) {
    var level = node['attrs']['level'] ?? 1;
    var content = node['content'];
    return Container(
        margin: EdgeInsets.only(
            top: (_defaultHeadingSizes[level]! / 2.0), bottom: 1),
        child: Text.rich(
          TextSpan(
            children: next?.call(content),
          ),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: _defaultHeadingSizes[level],
          ),
          textAlign: TextAlign.start,
        ));
  }
}
