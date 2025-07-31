import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/mark.dart';

var CodeExtension = Mark(
    name: "code",
    addStyle: (node, mark) => const TextStyle(
          backgroundColor: Color(0xFFE0E0E0),
          fontFamily: 'monospace',
        ),
    wrapSpan: (inner, node, mark) {
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
    });
