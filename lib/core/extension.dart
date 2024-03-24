import 'package:flutter/widgets.dart';
import 'package:tiptap_flutter/extensions/extensions.dart';
import 'package:tiptap_flutter/types/types.dart';

typedef NodeRenderer = TiptapBlockRenderer Function(dynamic node,
    {dynamic next});
typedef StyleAdder = TextStyle Function(dynamic node, MarkOld mark);
typedef CommandAdder = Map<String, Function> Function(
    dynamic node, dynamic mark);

class AnyExtension<Options, Storage> {
  final String type = "node";
  final String name;
  final AnyExtension? parent;
  final AnyExtension? child;
  final Options? options;
  final Storage? storage;
  final int? priority;
  final Options? defaultOptions;
  final String? content;
  final String? group;
  // NodeConfig<Options, Storage> config;
  final Map<String, dynamic>? data;
  final NodeRenderer? renderer;
  final StyleAdder? addStyle;
  final CommandAdder? addCommands;

  String get nodeType => name;

  const AnyExtension({
    required this.name,
    this.renderer,
    this.content,
    this.group,
    this.parent,
    this.child,
    this.options,
    this.storage,
    this.priority,
    this.defaultOptions,
    this.data,
    this.addStyle,
    this.addCommands,
  });
}

typedef Extension = AnyExtension;
typedef Extensions = List<AnyExtension>;
