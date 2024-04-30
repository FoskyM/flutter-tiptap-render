import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';
import 'package:tiptap_flutter/extensions/extensions.dart';

var HardBreakExtension = Node(
    name: "hardBreak",
    group: "block",
    renderer: (node, {next}) => HardBreakWidget(node, next: next));

class HardBreakWidget extends TiptapBlockRenderer {
  const HardBreakWidget(super.node, {super.key, super.next});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 0.0,
      ),
    );
  }
}
