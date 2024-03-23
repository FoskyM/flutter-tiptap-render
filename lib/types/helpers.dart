import 'package:tiptap_flutter/types/blocks.dart';
import 'package:tiptap_flutter/types/inlines.dart';
import 'package:tiptap_flutter/types/schema_constraints.dart';

class Helpers {
  /// Checks if the node is an instance of Inline
  static bool isInline(dynamic node) {
    return INLINES.fromValue(node['type']) != null;
  }

  /// Checks if the node is an instance of Block
  static bool isBlock(dynamic node) {
    return BLOCKS.fromValue(node['type']) != null;
  }

  /// Checks if the node is an instance of TopLevelBlocks
  static bool isTopLevelBlock(dynamic node) {
    return TopLevelBlockEnum.fromValue(node['type']) != null;
  }

  static bool isDocument(dynamic node) {
    return node['type'] == 'doc';
  }

  /// Checks if the node is an instance of Paragraph
  static bool isParagraph(dynamic node) {
    return node['type'] == 'paragraph';
  }

  /// Checks if the node is a Header
  static bool isHeader(dynamic node) {
    return node['type'] == 'heading';
  }

  /// Checks if the node is a Image
  static bool isImage(dynamic node) {
    return node['type'] == 'image';
  }

  /// Checks if the node is an instance of Text
  static bool isText(dynamic node) {
    return node['type'] == 'text';
  }

  /// Checks if the node is an instance of Hyperlink
  static bool isHyperlink(dynamic node) {
    return node['marks']['type'] == 'link';
  }
}
