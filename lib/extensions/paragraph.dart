import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';

var ParagraphExtension = Node(
    name: "paragraph",
    priority: 1000,
    group: "block",
    content: "inline*",
    renderer: (node, {next, attributes, extension, parentNode}) {
      var top = extension?.data?["top"] ?? 8;
      var bottom = extension?.data?["bottom"] ?? 8;
      if (parentNode != null && parentNode['type'] == 'listItem') {
        top = 0;
        bottom = 0;
        print('listItem\'s child');
      }

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
