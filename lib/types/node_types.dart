import 'package:tiptap_flutter/types/blocks.dart';
import 'package:tiptap_flutter/types/inlines.dart';
import 'package:tiptap_flutter/types/types.dart';

class Document extends Block {
  BLOCKS nodeType = BLOCKS.DOCUMENT;
  Map<dynamic, dynamic>? data;
  List<dynamic>? content;
}

class Heading extends Block {
  BLOCKS nodeType = BLOCKS.HEADING;
  Map<dynamic, dynamic>? data;
  List<dynamic>? content;
}

// Paragraph
class ParagraphNode extends Block {
  BLOCKS nodeType = BLOCKS.PARAGRAPH;
  Map<dynamic, dynamic>? data;
  List<dynamic>? content;
}

// Quote
class Quote extends Block {
  BLOCKS nodeType = BLOCKS.QUOTE;
  Map<dynamic, dynamic>? data;
  List<dynamic>? content;
}

// Horizontal rule
class Hr extends Block {
  BLOCKS nodeType = BLOCKS.HR;
  Map<dynamic, dynamic>? data;
  List<dynamic>? content;
}

// OL
class OrderedList extends Block {
  BLOCKS nodeType = BLOCKS.OL_LIST;
  Map<dynamic, dynamic>? data;
  List<dynamic>? content;
}

// UL
class UnorderedList extends Block<ListItem> {
  BLOCKS nodeType = BLOCKS.UL_LIST;
  Map<dynamic, dynamic>? data;
  List<ListItem>? content;
}

class ListItem extends Block<TopLevelBlock> {
  BLOCKS nodeType = BLOCKS.LIST_ITEM;
  Map<dynamic, dynamic>? data;
  List<TopLevelBlock>? content;
}

// taken from graphql schema-generator/contentful-types/link.ts
//class Link<T extends String> {
//
//  sys: {
//    type: 'Link';
//    linkType: T;
//    id: string;
//  };
//}

class EntryLinkBlock extends Block {
  BLOCKS nodeType = BLOCKS.EMBEDDED_ENTRY;
  Map<dynamic, dynamic>? data;
  List<dynamic>? content;
}

class AssetLinkBlock extends Block {
  BLOCKS nodeType = BLOCKS.EMBEDDED_ASSET;
  Map<dynamic, dynamic>? data;
  List<dynamic>? content;
}

// INLINE
class EntryLinkInline extends Inline<String> {
  INLINES nodeType = INLINES.EMBEDDED_ENTRY;
  Map<dynamic, dynamic>? data;
  List<String>? content;
}

class Hyperlink extends Inline<String> {
  INLINES nodeType = INLINES.HYPERLINK;
  Map<dynamic, dynamic>? data;
  List<String>? content;
}

class AssetHyperlink extends Inline<String> {
  INLINES nodeType = INLINES.ASSET_HYPERLINK;
  Map<dynamic, dynamic>? data;
  List<String>? content;
}

class EntryHyperlink extends Inline<String> {
  INLINES nodeType = INLINES.ENTRY_HYPERLINK;
  Map<dynamic, dynamic>? data;
  List<String>? content;
}
