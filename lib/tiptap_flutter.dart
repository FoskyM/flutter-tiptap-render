library tiptap_flutter;

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/extension.dart';
import 'package:tiptap_flutter/core/extensions_manager.dart';
import 'package:tiptap_flutter/types/types.dart';

export "package:tiptap_flutter/extensions/lib.dart";

/// This is the main entry point for Tiptap. To render
/// Flutter widgets, in your app instantiate Tiptap with
/// the JSON data, as well as a list of Tiptap Extensions.
class TiptapRenderer extends StatelessWidget {
  final dynamic schema;
  late final Extensions extensions;

  TiptapRenderer(this.schema, {super.key, Extensions? extensions}) {
    Extensions newExtensions = [];
    newExtensions.addAll(extensions ?? []);
    this.extensions = ExtensionsManager.sort(newExtensions);
  }

  /// nodeToWidget handles converting a node into a Widget, as well as handling
  /// any custom logic needed to accommodate different node types
  InlineSpan? nodeToWidget(dynamic node) {
    AnyExtension? chosen = extensions
        .firstWhereOrNull((extension) => extension.nodeType == node['type']);

    if (chosen == null) {
      if (kDebugMode) print("Unhandled node type: ${node['type']}");
      return null;
    }

    AnyExtension extension = chosen.extend();

    TextStyle? style;
    GestureRecognizer? recognizer;

    if (node['marks'] != null && node['marks'].isNotEmpty) {
      var markExtensions = node['marks'].map((item) {
        var mark = MarkOld(item['type'], item['attrs']);
        return (
          mark: mark,
          markHandler: extensions
              .firstWhereOrNull((extension) => extension.nodeType == mark.type)
        );
      }).where((item) {
        if (item.markHandler == null) {
          if (kDebugMode) {
            print("Unhandled mark: ${item.mark['type']}");
          }
        }
        return item.markHandler != null;
      });

      var markRenderers =
          markExtensions.where((item) => item.markHandler.addStyle != null);
      var actionRenderers =
          markExtensions.where((item) => item.markHandler.addCommands != null);
      var markStyles = markRenderers
          .map((item) => item.markHandler.addStyle!.call(node, item.mark));
      var markActions = actionRenderers
          .map((item) => item.markHandler.addCommands!.call(node, item.mark));

      style = markStyles.fold(const TextStyle(),
          (previousValue, mark) => previousValue?.merge(mark));

      recognizer = markActions.isNotEmpty
          ? (TapGestureRecognizer()
            ..onTap = () async {
              for (var action in markActions) {
                if (action != null) {
                  action["onTap"]?.call();
                }
              }
            })
          : null;
    }

    return extension.renderer!(node,
        next: nodeToWidget,
        attributes: Attributes(style: style, recognizer: recognizer));
  }

  static String text(dynamic schema) {
    if (schema['text'] != null) {
      return schema['text'];
    }

    List<dynamic>? content = schema['content'];

    if (content == null) {
      return "";
    }

    return content
        .map((e) => text(e))
        .join(schema['type'] == "doc" ? "\n" : "");
  }

  @override
  Widget build(BuildContext context) {
    if (schema != null && schema['content'] != null) {
      return Text.rich(nodeToWidget(schema) ?? const TextSpan());
    }
    return Container();
  }
}
