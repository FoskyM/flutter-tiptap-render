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
    if (kDebugMode) {
      this.extensions.toList().forEach((item) {
        print(
            "Registered extension, type: ${item.nodeType}, name: ${item.name}");
      });
    }
  }

  /// nodeToWidget handles converting a node into a Widget, as well as handling
  /// any custom logic needed to accommodate different node types
  InlineSpan? nodeToWidget(dynamic node) {
    AnyExtension? chosen = extensions.firstWhereOrNull((extension) =>
        extension.nodeType == node['type'] || extension.name == node['type']);

    if (chosen == null) {
      if (kDebugMode) print("Unhandled node type: ${node['type']}");
      return null;
    }

    AnyExtension extension = chosen.extend();

    InlineSpan widgetSpan = extension.renderer!(
      node,
      next: nodeToWidget,
      attributes: Attributes(),
    );

    if (node['marks'] == null || node['marks'].isEmpty) return widgetSpan;

    var markExtensions = node['marks'].map((item) {
      var mark = MarkInstance(item['type'], item['attrs']);
      var markHandler = extensions.firstWhereOrNull(
        (extension) =>
            extension.nodeType == mark.type || extension.name == mark.type,
      );
      if (markHandler != null) {
        mark =
            MarkInstance(item['type'], item['attrs'], extension: markHandler);
      }
      return (mark: mark, handler: markHandler);
    }).where((item) {
      if (item.handler == null) {
        if (kDebugMode) print("Unhandled mark: ${item.mark.type}");
      }
      return item.handler != null;
    }).toList();

    final markStyles = markExtensions
        .where((item) => item.handler!.addStyle != null)
        .map((item) => item.handler!.addStyle!(node, item.mark));
    final mergedStyle = markStyles.fold(
        const TextStyle(), (previousValue, mark) => previousValue?.merge(mark));

    final markActions = markExtensions
        .where((item) => item.handler!.addCommands != null)
        .map((item) => item.handler!.addCommands!(node, item.mark));
    GestureRecognizer? recognizer;
    if (markActions.isNotEmpty) {
      recognizer = TapGestureRecognizer()
        ..onTap = () {
          for (var action in markActions) {
            action["onTap"]?.call();
          }
        };
    }

    widgetSpan = TextSpan(
      children: [widgetSpan],
      style: mergedStyle,
      recognizer: recognizer,
    );

    for (var item in markExtensions.reversed) {
      var handler = item.handler!;
      var mark = item.mark;
      if (handler.wrapSpan != null) {
        widgetSpan = handler.wrapSpan!(widgetSpan, node, mark);
      }
    }

    return widgetSpan;
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
