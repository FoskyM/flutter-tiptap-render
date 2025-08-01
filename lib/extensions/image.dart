import 'package:flutter/widgets.dart';
import 'package:flutter_tiptap_render/core/node.dart';
import 'package:flutter_tiptap_render/extensions/extensions.dart';

var ImageExtension = Node(
    name: "image",
    renderer: (node, {next, attributes, extension, parentNode}) =>
        WidgetSpan(child: ImageWidget(node)));

class ImageWidget extends TiptapBlockRenderer {
  const ImageWidget(super.node, {super.key, super.next});

  @override
  Widget build(BuildContext context) {
    return Image.network(node['attrs']['src']);
  }
}
