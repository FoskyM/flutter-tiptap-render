import 'package:collection/collection.dart' show IterableExtension;

/// Map of all Tiptap inlines
class INLINES {
  final String _key;
  final String _value;
  const INLINES._internal(this._key, this._value);

  @override
  String toString() => 'INLINES.$_key';
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

  static const HYPERLINK = INLINES._internal('HYPERLINK', 'hyperlink');
  static const ENTRY_HYPERLINK =
      INLINES._internal('ENTRY_HYPERLINK', 'entry-hyperlink');
  static const ASSET_HYPERLINK =
      INLINES._internal('ASSET_HYPERLINK', 'asset-hyperlink');
  static const EMBEDDED_ENTRY =
      INLINES._internal('EMBEDDED_ENTRY', 'embedded-entry-inline');

  // Helpers
  static List<INLINES> get items => [
        HYPERLINK,
        ENTRY_HYPERLINK,
        ASSET_HYPERLINK,
        EMBEDDED_ENTRY,
      ];
  static INLINES? fromKey(String key) =>
      items.firstWhereOrNull((item) => item.key == key);

  static INLINES? fromValue(String value) =>
      items.firstWhereOrNull((item) => item.value == value);
}
