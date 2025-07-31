import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';

var HardBreakExtension = Node(
    name: "hardBreak",
    group: "inline",
    renderer: (node, {next, attributes, extension, parentNode}) =>
        const TextSpan(text: "\n"));
