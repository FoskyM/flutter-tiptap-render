import 'package:collection/collection.dart' show IterableExtension;

/// Map of all Tiptap block types.
/// Blocks contain inline or block nodes.
class BLOCKS {
  final String _key;
  final String _value;
  const BLOCKS._internal(this._key, this._value);

  @override
  String toString() => 'BLOCKS.$_key';
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

  static const DOCUMENT = BLOCKS._internal('DOCUMENT', 'doc');
  static const PARAGRAPH = BLOCKS._internal('PARAGRAPH', 'paragraph');
  static const HEADING = BLOCKS._internal('HEADING', 'heading');
  static const OL_LIST = BLOCKS._internal('OL_LIST', 'ordered-list');
  static const UL_LIST = BLOCKS._internal('UL_LIST', 'unordered-list');
  static const LIST_ITEM = BLOCKS._internal('LIST_ITEM', 'list-item');
  static const HR = BLOCKS._internal('HR', 'hr');
  static const QUOTE = BLOCKS._internal('QUOTE', 'blockquote');
  static const EMBEDDED_ENTRY =
      const BLOCKS._internal('EMBEDDED_ENTRY', 'embedded-entry-block');
  static const EMBEDDED_ASSET =
      const BLOCKS._internal('EMBEDDED_ASSET', 'embedded-asset-block');

  // Helpers
  static List<BLOCKS> get items => [
        DOCUMENT,
        PARAGRAPH,
        HEADING,
        OL_LIST,
        UL_LIST,
        LIST_ITEM,
        HR,
        QUOTE,
        EMBEDDED_ENTRY,
        EMBEDDED_ASSET,
      ];
  static BLOCKS? fromKey(String key) {
    return items.firstWhereOrNull((item) => item.key == key);
  }

  static BLOCKS? fromValue(String value) {
    return items.firstWhereOrNull((item) => item.value == value);
  }
}
