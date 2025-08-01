import 'package:flutter/material.dart';
import 'package:flutter_tiptap_render/core/mark.dart';

var BoldExtension = Mark(
    name: "bold",
    addStyle: (node, mark) => const TextStyle(fontWeight: FontWeight.bold));
