import 'package:flutter/material.dart';
import 'package:flutter_tiptap_render/core/mark.dart';

var ItalicExtension = Mark(
    name: "italic",
    addStyle: (node, mark) => const TextStyle(fontStyle: FontStyle.italic));
