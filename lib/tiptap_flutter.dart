library tiptap_flutter;

import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape_small.dart';
import 'package:tiptap_flutter/state/renderers.dart';
import 'package:tiptap_flutter/types/blocks.dart';
import 'package:tiptap_flutter/types/helpers.dart';
import 'package:tiptap_flutter/types/inlines.dart';
import 'package:tiptap_flutter/types/marks.dart';
import 'package:tiptap_flutter/types/types.dart';
import 'package:tiptap_flutter/widgets/document.dart';
import 'package:tiptap_flutter/widgets/heading.dart';
import 'package:tiptap_flutter/widgets/hr.dart';
import 'package:tiptap_flutter/widgets/inline_embedded_entry.dart';
import 'package:tiptap_flutter/widgets/list_item.dart';
import 'package:tiptap_flutter/widgets/ordered_list.dart';
import 'package:tiptap_flutter/widgets/paragraph.dart';
import 'package:tiptap_flutter/widgets/unordered_list.dart';

/// This is the main entry point for Tiptap. To render
/// Flutter widgets, in your app instantiate Tiptap with
/// the JSON data, as well as any (optional) Renderer or Mark options.
class Tiptap extends StatelessWidget {
  final RenderNode defaultNodeRenderers = RenderNode({
    BLOCKS.DOCUMENT.value: (node, next) => Document(node, next),
    BLOCKS.PARAGRAPH.value: (node, next) => Paragraph(node, next),
    BLOCKS.HEADING.value: (node, next) => Heading(
          attrs: node['attrs'],
          level: node['attrs']['level'],
          content: node['content'] ?? '',
          next: next,
        ),
    BLOCKS.EMBEDDED_ENTRY.value: (node, next) => Container(), // TODO: implement
    BLOCKS.UL_LIST.value: (node, next) =>
        UnorderedList(node['content'] ?? '', next),
    BLOCKS.OL_LIST.value: (node, next) =>
        OrderedList(node['content'] ?? '', next),
    BLOCKS.LIST_ITEM.value: (node, next) => ListItem(
          text: node.value,
          type: node.nodeType == BLOCKS.OL_LIST.value
              ? ListItemType.ordered
              : ListItemType.unordered,
          children: node['content'] ?? '',
        ),
    BLOCKS.QUOTE.value: (node, next) => Container(), // TODO: implement
    BLOCKS.HR.value: (node, next) => Hr(),
    INLINES.ASSET_HYPERLINK.value: (node, next) =>
        _defaultInline(INLINES.ASSET_HYPERLINK, node as Inline),
    INLINES.ENTRY_HYPERLINK.value: (node, next) =>
        _defaultInline(INLINES.ENTRY_HYPERLINK, node as Inline),
    INLINES.EMBEDDED_ENTRY.value: (node, next) =>
        InlineEmbeddedEntry(node, next),
  });

  // TODO: implement
  static Widget _defaultInline(INLINES type, Inline node) => Container();

  final dynamic richTextJson;
  final RenderNode? nodeRenderer;
  final RenderMark? markRenderer;

  Tiptap(this.richTextJson, {this.nodeRenderer, this.markRenderer});

  /// nodeListToWidget renders the Widget tree from the data nodes
  Widget nodeListToWidget(List<dynamic>? nodes) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: nodes?.map<Widget>((node) => nodeToWidget(node)).toList() ?? [],
    );
  }

  /// nodeToWidget handles converting a node into a Widget, as well as handling
  /// any custom logic needed to accommodate different node types
  Widget nodeToWidget(dynamic node) {
    if (Helpers.isText(node)) {
      return Text.rich(TextSpan(text: _processInlineNode(node)));
    } else if (Helpers.isDocument(node)) {
      return singletonRenderers.renderNode[node['type']]!(
        node,
        nodeToWidget,
      );
    } else if (Helpers.isParagraph(node) || Helpers.isHeader(node)) {
      // TODO: Headers don't appear to set their size properly
      return singletonRenderers.renderNode[node['type']]!(
        node,
        (nodes) => List<TextSpan>.from(
          nodes.map(
            (node) => _processInlineNode(node),
          ),
        ),
      );
    } else if (Helpers.isImage(node)) {
      return Image.network(node['attrs']['src']);
    } else {
      print("Unhandled node type: ${node['type']}");
      Next nextNode = (nodes) => nodeListToWidget(nodes);
      if (node['type'] == null ||
          singletonRenderers.renderNode[node['type']] == null) {
        return SizedBox.shrink();
      }
      return singletonRenderers.renderNode[node['type']]!(node, nextNode);
    }
  }

  /// _processInlineNode handle converting nodes into (potentially
  /// nested) TextSpans, typically coming from Paragraph, Heading and
  /// Hyperlink nodes
  dynamic _processInlineNode(
    node, {
    String? uri,
  }) {
    if (node['type'] == 'hyperlink' || uri?.isNotEmpty == true) {
      // Note: Hyperlinks are nested in other blocs like Paragraphs/Headers
      String link = uri ?? node['data']['uri'];
      String nodeType = node['type'] ?? '';
      if (uri?.isNotEmpty == true && node['type'] == 'text') {
        // ensure Hyperlink is used for text blocks with uris
        nodeType = 'hyperlink';
        // pass uri for Hyperlink on text nodes for TapRecognizer
        node['data'] = {'uri': link};
      }
      return singletonRenderers.renderNode[nodeType]!(
        node,
        (nodes) =>
            nodes
                ?.map<TextSpan>(
                  (node) => _processInlineNode(
                    node,
                    uri: link,
                  ) as TextSpan,
                )
                ?.toList() ??
            <InlineSpan>[],
      );
    }

    // for links to entries only process the child-nodes
    if (node['type'] == 'entry-hyperlink') {
      return TextSpan(
        children: (node['content'] ?? '')
            .map<TextSpan>((subNode) => _processInlineNode(subNode) as TextSpan)
            .toList(),
      );
    }

    if (node['type'] == 'embedded-entry-inline') {
      return singletonRenderers.renderNode[node['type']]!(
        node,
        (nodes) =>
            nodes
                ?.map<TextSpan>(
                  (node) => _processInlineNode(
                    node,
                  ) as TextSpan,
                )
                ?.toList() ??
            <InlineSpan>[],
      );
    }

    // If not a hyperlink, process as text node
    TextNode textNode = TextNode(node);
    String nodeValue = HtmlUnescape().convert(textNode.value);
    if (textNode.marks.isNotEmpty) {
      return TextSpan(
          text: nodeValue,
          style: MARKS.getMarksTextStyles(
            textNode.marks,
            singletonRenderers.renderMark,
          ),
          recognizer: MARKS.getMarksTextRecognizers(
              textNode.marks, singletonRenderers.renderMark));
    }
    return TextSpan(text: nodeValue);
  }

  @override
  Widget build(BuildContext context) {
    if (richTextJson != null && richTextJson['content'] != null) {
      singletonRenderers.renderNode = Map.from(
        defaultNodeRenderers.renderNodes,
      );
      if (nodeRenderer?.renderNodes != null) {
        singletonRenderers.renderNode.addAll(nodeRenderer!.renderNodes);
      }
      singletonRenderers.renderMark = MARKS.renderMarks(
        markRenderer?.renderMarks,
      );

      return nodeToWidget(richTextJson);
    }
    return Container();
  }
}
