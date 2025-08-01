import 'package:flutter/material.dart';
import 'package:flutter_tiptap_render/core/mark.dart';

var StrikeExtension = Mark(
    name: "strike",
    addStyle: (node, mark) =>
        const TextStyle(decoration: TextDecoration.lineThrough));
