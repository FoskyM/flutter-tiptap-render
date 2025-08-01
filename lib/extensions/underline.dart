import 'package:flutter/material.dart';
import 'package:flutter_tiptap_render/core/mark.dart';

var UnderlineExtension = Mark(
    name: "underline",
    addStyle: (node, mark) =>
        const TextStyle(decoration: TextDecoration.underline));
