import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';
import 'package:tiptap_flutter/extensions/extensions.dart';

var OrderedListExtension = Node(
    name: 'orderedList',
    group: "block list",
    content: "paragraph block*",
    renderer: (node, {next, attributes}) =>
        WidgetSpan(child: OrderedListWidget(node, next: next)));

class OrderedListWidget extends TiptapBlockRenderer {
  const OrderedListWidget(super.node, {super.key, super.next});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
          left: 5.0,
        ),
        child: Column(
            children: node['content']
                .asMap()
                .entries
                .map<Widget>((entry) => Row(
                        children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Text('${entry.key + 1}.'),
                      ),
                      Text.rich((next?.call(entry.value) ?? const TextSpan()))
                    ].toList()))
                .toList()));
  }
}
