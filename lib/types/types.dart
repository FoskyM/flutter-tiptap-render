import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/extension.dart';

class NodeConfig<Options, Storage> {
  late String name;
  Storage? defaultStorage;

  NodeConfig({required this.name, this.defaultStorage});
}

class MarkInstance {
  final String type;
  final dynamic attrs;
  final AnyExtension? extension;

  MarkInstance(this.type, this.attrs, {this.extension});
}

// Helper types for Rich Text Rendering
typedef Next = InlineSpan? Function(dynamic nodes);
typedef NodeRenderer = dynamic Function(dynamic node, Next next);

class RenderNode<T> {
  final Map<T, NodeRenderer> renderNodes; // NodeRenderer not Function
  RenderNode(this.renderNodes);
}

class RenderMark<T> {
  final Map<T, TextStyle> renderMarks;

  RenderMark(this.renderMarks);
}

class Options {
  /// Node renderers
  RenderNode renderNode;

  /// Mark renderers
  RenderMark? renderMark;

  Options({required this.renderNode, this.renderMark});
}
