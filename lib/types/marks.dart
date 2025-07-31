import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tiptap_flutter/types/types.dart';
import 'package:url_launcher/url_launcher.dart';

/// Map of all Tiptap marks
class MARKS {
  final String _key;
  final String _value;
  const MARKS._internal(this._key, this._value);

  @override
  String toString() => 'MARKS.$_key';
  String get key => _key;
  String get value => _value;

  operator [](dynamic index) {
    if (index is int) {
      return index <= items.length ? items[index] : null;
    }

    if (index is String) {
      return items.firstWhereOrNull((item) => item.key == index);
    }
    return null;
  }

  static const BOLD = MARKS._internal('BOLD', 'bold');
  static const ITALIC = MARKS._internal('ITALIC', 'italic');
  static const UNDERLINE = MARKS._internal('UNDERLINE', 'underline');
  static const STRIKE = MARKS._internal('STRIKE', 'strike');
  static const LINK = MARKS._internal("LINK", "link");

  // Helpers
  static List<MARKS> get items => [BOLD, ITALIC, UNDERLINE, STRIKE, LINK];
  static MARKS? fromKey(String key) =>
      items.firstWhereOrNull((item) => item.key == key);

  static MARKS? fromValue(String value) =>
      items.firstWhereOrNull((item) => item.value == value);

  // Can only be used to apply styling, does not return a TextSpan
  static RenderMark defaultMarkRenderers = RenderMark({
    MARKS.BOLD.value: const TextStyle(fontWeight: FontWeight.bold),
    MARKS.ITALIC.value: const TextStyle(fontStyle: FontStyle.italic),
    MARKS.UNDERLINE.value:
        const TextStyle(decoration: TextDecoration.underline),
    MARKS.STRIKE.value: const TextStyle(decoration: TextDecoration.lineThrough),
    MARKS.LINK.value: const TextStyle(
        color: Colors.blueAccent,
        decoration: TextDecoration.underline,
        decorationColor: Colors.blueAccent)
  });

  static TextStyle getMarksTextStyles(
          List<MarkInstance> marks, Map<dynamic, TextStyle> renderMark) =>
      marks.fold(const TextStyle(),
          (previousValue, mark) => previousValue.merge(renderMark[mark.type]));

  static GestureRecognizer? getMarksTextRecognizers(
      List<MarkInstance> marks, Map<dynamic, TextStyle> renderMark) {
    var link = marks.firstWhereOrNull((element) => element.type == "link");

    return link == null
        ? null
        : (TapGestureRecognizer()
          ..onTap = () async {
            if (kDebugMode) {
              print('Hyperlink onTap: ${link.attrs['href']}');
            }
            // NOTE: Defaults to Url_Launcher, but component can be overridden
            final uri = Uri.tryParse(link.attrs['href']);
            if (uri != null && await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          });
  }

  static Map<dynamic, TextStyle> renderMarks(
          Map<dynamic, TextStyle>? optionRenderMarks) =>
      optionRenderMarks == null
          ? Map.from(MARKS.defaultMarkRenderers.renderMarks)
          : (Map.from(MARKS.defaultMarkRenderers.renderMarks)
            ..addAll(optionRenderMarks));
}
