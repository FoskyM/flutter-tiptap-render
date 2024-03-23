import 'package:flutter/material.dart';
import 'package:tiptap_flutter/state/renderers.dart';
import 'package:tiptap_flutter/types/marks.dart';
import 'package:tiptap_flutter/types/types.dart';

class InlineEmbeddedEntry extends TextSpan {
  InlineEmbeddedEntry(node, next)
      : super(
          text: node['value'],
          style: MARKS
              .getMarksTextStyles(
                TextNode(node).marks,
                singletonRenderers.renderMark,
              )
              // TODO: Check if only marks should be used instead of these hard coded values
              .copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
          children: next(node['content']),
        );
}
