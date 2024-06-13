import 'package:flutter/widgets.dart';
import 'package:tiptap_flutter/core/node.dart';

var TextExtension = Node(
    name: "text",
    group: "inline",
    inline: true,
    renderer: (node, {next, attributes}) => TextSpan(
        text: (node["text"]),
        style: attributes?.style,
        recognizer: attributes?.recognizer));
