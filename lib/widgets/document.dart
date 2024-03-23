import 'package:flutter/material.dart';
import 'package:tiptap_flutter/types/types.dart';

class Document extends StatelessWidget {
  final dynamic node;
  final Next next;

  const Document(this.node, this.next, {super.key});

  @override
  Widget build(BuildContext context) {
    if (node != null && node['content'] != null) {
      var documentNode = DocumentNode.fromJson(node);
      var content = (documentNode?.content ?? []).toList();

      return SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: content.map((node) => next(node) as Widget).toList()));
    }
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }
}
