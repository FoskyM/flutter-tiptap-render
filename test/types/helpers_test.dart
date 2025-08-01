import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tiptap_render/types/helpers.dart';

void main() {
  final inlineNode = {'type': 'entry-hyperlink'};
  final blockNode = {'type': 'hr'};
  final topLevelBlocNode = {'type': 'hr'};
  final paragraphNode = {'type': 'paragraph'};
  final headerNode = {'type': 'heading'};
  final textNode = {'type': 'text'};
  final hyperlinkNode = {'type': 'hyperlink'};

  test('should check if node is inline', () {
    expect(Helpers.isInline(inlineNode), isTrue);
    expect(Helpers.isInline(blockNode), isFalse);
    expect(Helpers.isInline(topLevelBlocNode), isFalse);
    expect(Helpers.isInline(paragraphNode), isFalse);
    expect(Helpers.isInline(headerNode), isFalse);
    expect(Helpers.isInline(textNode), isFalse);
    expect(Helpers.isInline(hyperlinkNode), isTrue);
  });

  test('should check if node is block', () {
    expect(Helpers.isBlock(inlineNode), isFalse);
    expect(Helpers.isBlock(blockNode), isTrue);
    expect(Helpers.isBlock(topLevelBlocNode), isTrue);
    expect(Helpers.isBlock(paragraphNode), isTrue);
    expect(Helpers.isBlock(headerNode), isTrue);
    expect(Helpers.isBlock(textNode), isFalse);
    expect(Helpers.isBlock(hyperlinkNode), isFalse);
  });

  test('should check if node is paragraph', () {
    expect(Helpers.isParagraph(inlineNode), isFalse);
    expect(Helpers.isParagraph(blockNode), isFalse);
    expect(Helpers.isParagraph(topLevelBlocNode), isFalse);
    expect(Helpers.isParagraph(paragraphNode), isTrue);
    expect(Helpers.isParagraph(headerNode), isFalse);
    expect(Helpers.isParagraph(textNode), isFalse);
    expect(Helpers.isParagraph(hyperlinkNode), isFalse);
  });

  test('should check if node is header', () {
    expect(Helpers.isHeader(inlineNode), isFalse);
    expect(Helpers.isHeader(blockNode), isFalse);
    expect(Helpers.isHeader(topLevelBlocNode), isFalse);
    expect(Helpers.isHeader(paragraphNode), isFalse);
    expect(Helpers.isHeader(headerNode), isTrue);
    expect(Helpers.isHeader(textNode), isFalse);
    expect(Helpers.isHeader(hyperlinkNode), isFalse);
  });

  test('should check if node is text', () {
    expect(Helpers.isText(inlineNode), isFalse);
    expect(Helpers.isText(blockNode), isFalse);
    expect(Helpers.isText(topLevelBlocNode), isFalse);
    expect(Helpers.isText(paragraphNode), isFalse);
    expect(Helpers.isText(headerNode), isFalse);
    expect(Helpers.isText(textNode), isTrue);
    expect(Helpers.isText(hyperlinkNode), isFalse);
  });
}
