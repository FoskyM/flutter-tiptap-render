import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/mark.dart';

var UnderlineExtension = Mark(
    name: "bold",
    addStyle: (node, mark) =>
        const TextStyle(decoration: TextDecoration.underline));
