import 'package:flutter/material.dart';
import 'package:tiptap_flutter/types/types.dart';

class Paragraph extends StatelessWidget {
  final dynamic node;
  final Next next;

  const Paragraph(this.node, this.next, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 8, top: 8),
        child: SelectableText.rich(
          TextSpan(
            children: next(node['content']),
          ),
          style: const TextStyle(
            fontSize: 16,
            height: 1.6,
          ),
        ));
  }
}
