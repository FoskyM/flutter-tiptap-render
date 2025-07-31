import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';
import 'package:tiptap_flutter/extensions/extensions.dart';

var OrderedListExtension = Node(
    name: 'orderedList',
    group: "block list",
    content: "paragraph block*",
    renderer: (node, {next, attributes, extension, parentNode}) => WidgetSpan(
        child: OrderedListWidget(node, next: next, extension: extension)));

class OrderedListWidget extends TiptapBlockRenderer {
  const OrderedListWidget(super.node, {super.key, super.next, super.extension});

  @override
  Widget build(BuildContext context) {
    var top = extension?.data?["top"] ?? 8;
    var bottom = extension?.data?["bottom"] ?? 8;

    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
            children: (node['content'] ?? [])
                .asMap()
                .entries
                .map<Widget>((entry) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            right: 10.0, top: top, bottom: bottom),
                        child: Text('${entry.key + 1}.'),
                      ),
                      Expanded(
                          child: Text.rich(
                              (next?.call(entry.value) ?? const TextSpan())))
                    ].toList()))
                .toList()));
  }
}
