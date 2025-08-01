import 'package:flutter/material.dart';
import 'package:flutter_tiptap_render/core/node.dart';
import 'package:flutter_tiptap_render/extensions/extensions.dart';

var DocumentExtension = Node(
    name: "doc",
    content: "block+",
    renderer: ((node, {next, attributes, extension, parentNode}) =>
        WidgetSpan(child: DocumentWidget(node, next: next))),
    data: {"topNode": true});

class DocumentWidget extends TiptapBlockRenderer {
  const DocumentWidget(super.node, {super.key, super.next});

  @override
  Widget build(BuildContext context) {
    if (node != null && node['content'] != null) {
      var documentNode = DocumentNodeOld.fromJson(node);
      var content = (documentNode?.content ?? []).toList();

      return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: content
              .map((node) => next!(node))
              .where((element) => element != null)
              .map((element) => Text.rich(element as InlineSpan))
              .toList());
    }
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }
}

class DocumentNodeOld {
  final List<dynamic> content;

  DocumentNodeOld({
    required this.content,
    required String nodeType,
  });

  static DocumentNodeOld? fromJson(dynamic richTextJson) {
    if (richTextJson == null) {
      return null;
    }
    return DocumentNodeOld(
      content: richTextJson['content'],
      nodeType: richTextJson['type'],
    );
  }
}
