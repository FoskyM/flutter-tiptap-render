import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';
import 'package:tiptap_flutter/extensions/extensions.dart';

var BulletListExtension = Node(
    name: 'bulletList',
    group: "block list",
    content: "block list",
    renderer: (node, {next, attributes}) =>
        WidgetSpan(child: BulletListWidget(node, next: next)));

class BulletListWidget extends TiptapBlockRenderer {
  const BulletListWidget(super.node, {super.key, super.next});

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
                .map<Widget>((child) => Row(
                        children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        child: const Text(
                          '\u2022',
                          style: TextStyle(
                            fontSize: 26,
                          ),
                        ),
                      ),
                      Text.rich(next?.call(child) ?? const TextSpan())
                    ].toList()))
                .toList()));
  }
}
