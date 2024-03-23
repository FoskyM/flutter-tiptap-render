import 'package:flutter/material.dart';
import 'package:tiptap_flutter/types/types.dart';
import 'package:tiptap_flutter/widgets/list_item.dart';

class UnorderedList extends StatelessWidget {
  final double? indent;
  final List<dynamic> children;
  final Next next;

  const UnorderedList(this.children, this.next, {super.key, this.indent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children
          .map(
            (child) => ListItem.unordered(
              text: child['value'],
              children: <Widget>[
                next(child['content'])
              ], // TODO: Implement nested lists
            ),
          )
          .toList(),
    );
  }
}
