import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';
import 'package:tiptap_flutter/extensions/extensions.dart';

var BulletListExtension = Node(
    name: 'bulletList',
    group: "block list",
    content: "block list",
    renderer: (node, {next, attributes, extension, parentNode}) => WidgetSpan(
        child: BulletListWidget(node, next: next, extension: extension)));

class BulletListWidget extends TiptapBlockRenderer {
  const BulletListWidget(super.node, {super.key, super.next, super.extension});

  @override
  Widget build(BuildContext context) {
    double top = extension?.data?["top"] ?? 6.0;
    double bottom = extension?.data?["bottom"] ?? 6.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: (node['content'] ?? [])
            .map<Widget>((child) => Padding(
                  padding: EdgeInsets.only(top: top, bottom: bottom),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.only(top: 8, right: 10),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Expanded(
                        child: Text.rich(next?.call(child) ?? const TextSpan()),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
