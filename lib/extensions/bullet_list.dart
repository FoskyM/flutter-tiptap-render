import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';
import 'package:tiptap_flutter/extensions/extensions.dart';

var BulletListExtension = Node(
    name: 'bulletList',
    group: "block list",
    content: "block list",
    renderer: (node, {next, attributes, extension}) => WidgetSpan(
        child: BulletListWidget(node, next: next, extension: extension)));

class BulletListWidget extends TiptapBlockRenderer {
  const BulletListWidget(super.node, {super.key, super.next, super.extension});

  @override
  Widget build(BuildContext context) {
    var top = extension?.data?["top"] ?? 3;
    var bottom = extension?.data?["bottom"] ?? 3;

    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
            children: (node['content'] ?? [])
                .map<Widget>((child) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            right: 10.0, top: top, bottom: bottom),
                        child: const Text(
                          '\u2022',
                          style: TextStyle(
                            fontSize: 26,
                          ),
                        ),
                      ),
                      Expanded(
                          child:
                              Text.rich(next?.call(child) ?? const TextSpan()))
                    ].toList()))
                .toList()));
  }
}
