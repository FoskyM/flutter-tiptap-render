import 'package:flutter/widgets.dart';
import 'package:flutter_tiptap_render/core/extension.dart';
import 'package:flutter_tiptap_render/types/types.dart';

abstract class TiptapBlockRenderer extends StatelessWidget {
  final dynamic node;
  final Next? next;
  final AnyExtension? extension;

  const TiptapBlockRenderer(this.node, {super.key, this.next, this.extension});
}
