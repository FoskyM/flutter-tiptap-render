import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NodeConfig<Options, Storage> {
  late String name;
  Storage? defaultStorage;

  NodeConfig({required this.name, this.defaultStorage});
}

// abstract class Block<T> extends Node {
//   List<T>? content;
// }
//
// abstract class Inline<T> extends Node {
//   List<T>? content;
// }

// abstract class TopLevelBlock extends Node {
//   late TopLevelBlockEnum _nodeType;
// }

class TextNode {
  final String _nodeType;
  final String value;
  final List<MarkOld> marks;

  TextNode(dynamic node)
      : value = node['text'] ?? '',
        _nodeType = node['type'] ?? '',
        marks = (node['marks'] as List?)
                ?.map((mark) => MarkOld(mark['type'], mark['attrs']))
                .toList() ??
            <MarkOld>[];
}

class MarkOld {
  final String type;
  final dynamic attrs;

  MarkOld(this.type, this.attrs);
}

// Helper types for Rich Text Rendering
typedef Next = dynamic Function(dynamic nodes);
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
