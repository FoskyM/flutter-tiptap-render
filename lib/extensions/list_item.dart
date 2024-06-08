import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';
import 'package:tiptap_flutter/extensions/extensions.dart';

var ListItemExtension = Node(
    name: 'listItem',
    group: "block list",
    content: "paragraph block*",
    renderer: (node, {next}) => ListItemWidget(node, next: next));

class ListItemWidget extends TiptapBlockRenderer {
  const ListItemWidget(super.node, {super.key, super.next});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 0.0,
        ),
        child: Column(
          children: node['content']
              .map<Widget>((child) => next?.call(child) as Widget)
              .where((element) => element != null)
              .toList(),
        ));
  }
}
