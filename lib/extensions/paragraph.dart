import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';
import 'package:tiptap_flutter/extensions/extensions.dart';

var ParagraphExtension = Node(
    name: "paragraph",
    priority: 1000,
    content: "inline*",
    renderer: (node, {next}) => ParagraphWidget(node, next: next));

class ParagraphWidget extends TiptapBlockRenderer {
  const ParagraphWidget(super.node, {super.key, super.next});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 8, top: 8),
        child: SelectableText.rich(
          TextSpan(
            children: next?.call(node['content']),
          ),
          style: const TextStyle(
            fontSize: 16,
            height: 1.6,
          ),
        ));
  }
}
