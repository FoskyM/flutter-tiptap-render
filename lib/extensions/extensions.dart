import 'package:flutter/widgets.dart';
import 'package:tiptap_flutter/types/types.dart';

abstract class TiptapBlockRenderer extends StatelessWidget {
  final dynamic node;
  final Next? next;

  const TiptapBlockRenderer(this.node, {super.key, this.next});
}
