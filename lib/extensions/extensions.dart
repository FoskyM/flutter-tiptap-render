import 'package:flutter/widgets.dart';
import 'package:tiptap_flutter/core/extension.dart';
import 'package:tiptap_flutter/types/types.dart';

abstract class TiptapBlockRenderer extends StatelessWidget {
  final dynamic node;
  final Next? next;
  final AnyExtension? extension;

  const TiptapBlockRenderer(this.node, {super.key, this.next, this.extension});
}
