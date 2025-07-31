import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/mark.dart';

var CodeExtension = Mark(
  name: "code",
  addStyle: (node, mark) => const TextStyle(
    backgroundColor: Color(0xFFE0E0E0),
    fontFamily: 'monospace',
  ),
);
