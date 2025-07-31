import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:tiptap_flutter/types/types.dart';

typedef NodeRenderer = InlineSpan Function(dynamic node,
    {dynamic next, Attributes? attributes});
typedef StyleAdder = TextStyle Function(dynamic node, MarkInstance mark);
typedef CommandAdder = Map<String, Function> Function(
    dynamic node, dynamic mark);

typedef MarkWrapper = InlineSpan Function(
    InlineSpan inner, dynamic node, MarkInstance mark);

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
  final bool? inline;
  // NodeConfig<Options, Storage> config;
  final Map<String, dynamic>? data;
  final NodeRenderer? renderer;
  final StyleAdder? addStyle;
  final CommandAdder? addCommands;
  final MarkWrapper? wrapSpan;

  String nodeType = "";
  final TextStyle style = TextStyle();

  AnyExtension(
      {required this.name,
      this.renderer,
      this.content,
      this.group,
      this.inline,
      this.parent,
      this.child,
      this.options,
      this.storage,
      this.priority,
      this.defaultOptions,
      this.data,
      this.addStyle,
      this.addCommands,
      this.wrapSpan}) {
    this.nodeType = StringUtils.camelCaseToLowerUnderscore(this.name);
  }

  AnyExtension extend() {
    return AnyExtension(
        name: name,
        renderer: renderer,
        content: content,
        group: group,
        inline: inline,
        parent: parent,
        child: child,
        options: options,
        storage: storage,
        priority: priority,
        defaultOptions: defaultOptions,
        data: data);
  }
}

typedef Extension = AnyExtension;
typedef Extensions = List<AnyExtension>;

class Attributes {
  final TextStyle? style;
  final GestureRecognizer? recognizer;
  final Map<String, dynamic> attrs;

  Attributes({this.style, this.recognizer, this.attrs = const {}});
}
