import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';

var TextExtension = Node(
    name: "text",
    group: "inline",
    inline: true,
    renderer: (node, {next, attributes}) {
      final hasCodeMark =
          (node["marks"] as List?)?.any((mark) => mark["type"] == "code") ==
              true;
      // TODO: better code mark render
      // code is a mark type but we might need to render it as node in flutter,
      // does anyone have a better resolution?
      if (hasCodeMark) {
        return WidgetSpan(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              node["text"],
              style: const TextStyle(
                fontFamily: 'monospace',
                color: Colors.black87,
              ),
            ),
          ),
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
        );
      }

      return TextSpan(
          text: (node["text"]),
          style: attributes?.style,
          recognizer: attributes?.recognizer);
    });
