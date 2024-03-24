import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/mark.dart';

var BoldExtension = Mark(
    name: "bold",
    addStyle: (node, mark) => const TextStyle(fontWeight: FontWeight.bold));
