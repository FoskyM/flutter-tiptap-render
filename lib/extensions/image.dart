import 'package:flutter/widgets.dart';
import 'package:tiptap_flutter/core/node.dart';
import 'package:tiptap_flutter/extensions/extensions.dart';

var ImageExtension =
    Node(name: "image", renderer: (node, {next}) => ImageWidget(node));

class ImageWidget extends TiptapBlockRenderer {
  const ImageWidget(super.node, {super.key, super.next});

  @override
  Widget build(BuildContext context) {
    return Image.network(node['attrs']['src']);
  }
}
