import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';
import 'package:tiptap_flutter/extensions/extensions.dart';

var ListItemExtension = Node(
    name: 'listItem',
    group: "block list",
    content: "paragraph block*",
    renderer: (node, {next, attributes}) =>
        WidgetSpan(child: ListItemWidget(node, next: next)));

class ListItemWidget extends TiptapBlockRenderer {
  const ListItemWidget(super.node, {super.key, super.next});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      children: node['content']
          .map<InlineSpan>((child) => next?.call(child) ?? const TextSpan())
          .toList(),
    ));
  }
}
