import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';

var ParagraphExtension = Node(
    name: "paragraph",
    priority: 1000,
    group: "block",
    content: "inline*",
    renderer: (node, {next, attributes}) => WidgetSpan(
        child: Container(
            margin: const EdgeInsets.only(bottom: 8, top: 8),
            child: Text.rich(TextSpan(
              children: (node['content'])
                  .map<InlineSpan>((child) =>
                      next?.call(child) as InlineSpan? ?? const TextSpan())
                  .toList(),
            )))));
