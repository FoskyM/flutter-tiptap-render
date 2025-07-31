import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/mark.dart';

var StrikeExtension = Mark(
    name: "strike",
    addStyle: (node, mark) =>
        const TextStyle(decoration: TextDecoration.lineThrough));
