import 'package:flutter/material.dart';
import 'package:tiptap_flutter/core/mark.dart';

var HighlightExtension = Mark(
  name: "highlight",
  data: {"colorAlias": {}, "defaultColor": Colors.amber},
  wrapSpan: (inner, node, mark) {
    final Map<String, String>? aliasMap =
        (mark.extension?.data?['colorAlias'] as Map?)?.cast<String, String>();
    String? colorStr = (mark.attrs?['color'] as String?);
    final Color defaultColor =
        mark.extension?.data?['defaultColor'] as Color? ?? Colors.amber;

    Color? color = parseColor(defaultColor, colorStr, aliasMap);

    return WidgetSpan(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          node["text"],
          style: const TextStyle(
            fontFamily: 'monospace',
            color: Colors.white,
          ),
        ),
      ),
      alignment: PlaceholderAlignment.baseline,
      baseline: TextBaseline.alphabetic,
    );
  },
  addStyle: (node, mark) {
    return const TextStyle();
  },
);

Color parseColor(
    Color defaultColor, String? colorStr, Map<String, String>? aliasMap) {
  if (colorStr == null) return defaultColor;

  if (aliasMap != null && aliasMap.containsKey(colorStr)) {
    colorStr = aliasMap[colorStr]!;
  }

  colorStr = colorStr.trim().toLowerCase();

  try {
    if (colorStr.startsWith('#')) {
      String hex = colorStr.substring(1);
      if (hex.length == 3) hex = hex.split('').map((c) => '$c$c').join('');
      return Color(int.parse('FF$hex', radix: 16));
    }

    final rgbMatch = RegExp(r'rgba?\(([^)]+)\)').firstMatch(colorStr);
    if (rgbMatch != null) {
      final parts = rgbMatch.group(1)!.split(',').map((s) => s.trim()).toList();
      int r = int.parse(parts[0]);
      int g = int.parse(parts[1]);
      int b = int.parse(parts[2]);
      double a = 1.0;
      if (parts.length == 4) {
        a = double.parse(parts[3]);
      }
      return Color.fromRGBO(r, g, b, a);
    }

    final hslMatch = RegExp(r'hsla?\(([^)]+)\)').firstMatch(colorStr);
    if (hslMatch != null) {
      final parts = hslMatch.group(1)!.split(',').map((s) => s.trim()).toList();
      double h = double.parse(parts[0]);
      double s = double.parse(parts[1].replaceAll('%', '')) / 100;
      double l = double.parse(parts[2].replaceAll('%', '')) / 100;
      double a = 1.0;
      if (parts.length == 4) {
        a = double.parse(parts[3]);
      }
      return HSLColor.fromAHSL(a, h, s, l).toColor();
    }

    return defaultColor;
  } catch (_) {
    return defaultColor;
  }
}
