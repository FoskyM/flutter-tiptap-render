import 'package:tiptap_flutter/core/extension.dart';

class ExtensionsManager {
  static Extensions sort(Extensions extensions) {
    extensions.sort((a, b) => (a.priority ?? 100) - (b.priority ?? 100));
    return extensions;
  }
}
