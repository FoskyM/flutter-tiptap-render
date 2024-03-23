import 'package:flutter/material.dart';
import 'package:tiptap_flutter/types/types.dart';
import 'package:tiptap_flutter/widgets/list_item.dart';

class OrderedList extends StatelessWidget {
  final double? indent;
  final String punctuation;
  final Next next;

  /// index character, text for item
  final List<dynamic> children;

  const OrderedList(this.children, this.next,
      {super.key, this.indent, this.punctuation = '.'});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children
          .asMap()
          .entries
          .map(
            (entry) => ListItem.ordered(
              text: entry.value['value'],
              index: (entry.key + 1).toString(),
              children: <Widget>[
                next(entry.value['content'])
              ], // TODO: Implement nested lists
            ),
          )
          .toList(),
    );
  }
}
