import 'package:flutter/widgets.dart';
import 'package:tiptap_flutter/core/node.dart';
import 'package:tiptap_flutter/extensions/extensions.dart';

var TextExtension = Node(
    name: "text",
    group: "inline",
    renderer: (node, {next}) => TextWidget(node, next: next));

class TextWidget extends TiptapBlockRenderer {
  const TextWidget(super.node, {super.key, super.next});

  @override
  Widget build(BuildContext context) {
    return Text.rich(next?.call(node["text"]));
  }
}
