import 'package:flutter/widgets.dart';
import 'package:tiptap_flutter/types/blocks.dart';
import 'package:tiptap_flutter/types/inlines.dart';
import 'package:tiptap_flutter/types/schema_constraints.dart';

abstract class Node<T> {
  late T _nodeType;
  Map<dynamic, dynamic>? data;

  T get nodeType => _nodeType;
}

abstract class Block<T> extends Node<BLOCKS> {
  late BLOCKS _nodeType;
  List<T>? content;
}

abstract class Inline<T> extends Node<INLINES> {
  late INLINES _nodeType;
  List<T>? content;
}

abstract class TopLevelBlock extends Node<TopLevelBlockEnum> {
  late TopLevelBlockEnum _nodeType;
}

class DocumentNode extends Node<BLOCKS> {
  final BLOCKS _nodeType;
  final List<dynamic> content;

  DocumentNode({
    required this.content,
    required String nodeType,
  }) : _nodeType = BLOCKS.fromValue(nodeType) ?? BLOCKS.DOCUMENT {
    this.data = data;
  }

  static DocumentNode? fromJson(dynamic richTextJson) {
    if (richTextJson == null) {
      return null;
    }
    return DocumentNode(
      content: richTextJson['content'],
      nodeType: richTextJson['type'],
    );
  }
}

class TextNode extends Node<String> {
  final String _nodeType;
  final String value;
  final List<Mark> marks;

  TextNode(dynamic node)
      : value = node['text'] ?? '',
        _nodeType = node['type'] ?? '',
        marks = (node['marks'] as List?)
                ?.map((mark) => Mark(mark['type'], mark['attrs']))
                .toList() ??
            <Mark>[];
}

class Mark {
  final String type;
  final dynamic attrs;

  Mark(this.type, this.attrs);
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
