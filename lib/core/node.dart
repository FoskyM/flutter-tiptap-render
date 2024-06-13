import 'package:tiptap_flutter/core/extension.dart';

class Node<Options, Storage> extends AnyExtension {
  Node({
    required super.name,
    super.renderer,
    super.content,
    super.group,
    super.inline,
    super.parent,
    super.child,
    super.options,
    super.storage,
    super.priority,
    super.defaultOptions,
    super.data,
  });
}
