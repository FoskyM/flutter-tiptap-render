import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/node.dart';

var TextExtension = Node(
    name: "text",
    group: "inline",
    inline: true,
    renderer: (node, {next, attributes, extension, parentNode}) => TextSpan(
        text: (node["text"]),
        style: attributes?.style,
        recognizer: attributes?.recognizer));
