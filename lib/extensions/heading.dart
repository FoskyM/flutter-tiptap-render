import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';
import 'package:tiptap_flutter/extensions/extensions.dart';

var HeadingExtension = Node(
    name: "heading",
    content: "inline*",
    group: "block",
    renderer: (node, {next, attributes, extension}) => WidgetSpan(
        child: HeadingWidget(node, next: next, extension: extension)));

const baseFontSize = 12.0;

class HeadingWidget extends TiptapBlockRenderer {
  const HeadingWidget(super.node, {super.key, super.next, super.extension});

  static const defaultHeadingSizes = {
    1: baseFontSize * 2.25,
    2: baseFontSize * 2,
    3: baseFontSize * 1.75,
    4: baseFontSize * 1.5,
    5: baseFontSize * 1.25,
    6: baseFontSize,
  };

  @override
  Widget build(BuildContext context) {
    var level = node['attrs']['level'] ?? 1;
    var top = extension?.data?['top'] ?? (defaultHeadingSizes[level]! / 2.0);
    var bottom = extension?.data?['bottom'] ?? 1;
    return Container(
        margin: EdgeInsets.only(top: top, bottom: bottom),
        child: Text.rich(
          TextSpan(
            children: ((node['content'] ?? []).map<InlineSpan>(
                (node) => next?.call(node) ?? const TextSpan())).toList(),
          ),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: defaultHeadingSizes[level],
          ),
          textAlign: TextAlign.start,
        ));
  }
}
