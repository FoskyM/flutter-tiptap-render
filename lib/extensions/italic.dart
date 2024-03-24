import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/mark.dart';

var ItalicExtension = Mark(
    name: "italic",
    addStyle: (node, mark) => const TextStyle(fontStyle: FontStyle.italic));
