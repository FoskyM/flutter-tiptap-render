import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';

var ParagraphExtension = Node(
    name: "paragraph",
    priority: 1000,
    group: "block",
    content: "inline*",
    renderer: (node, {next, attributes, extension}) {
      final top = extension?.data?["top"] ?? 8;
      final bottom = extension?.data?["bottom"] ?? 8;

      return WidgetSpan(
          child: Container(
              margin: EdgeInsets.only(bottom: bottom, top: top),
              child: Text.rich(TextSpan(
                children: (node['content'] ?? [])
                    .map<InlineSpan>((child) =>
                        next?.call(child) as InlineSpan? ?? const TextSpan())
                    .toList(),
              ))));
    });
