import 'package:tiptap_flutter/core/extension.dart';

class Node<Options, Storage> extends AnyExtension {
  const Node({
    required super.name,
    required super.renderer,
    super.content,
    super.group,
    super.parent,
    super.child,
    super.options,
    super.storage,
    super.priority,
    super.defaultOptions,
    super.data,
  });
}
