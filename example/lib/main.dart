import 'package:example/tiptap_data.dart';
import 'package:flutter/material.dart';
import 'package:tiptap_flutter/extensions/bullet_list.dart';
import 'package:tiptap_flutter/extensions/hard_break.dart';
import 'package:tiptap_flutter/extensions/list_item.dart';
import 'package:tiptap_flutter/extensions/ordered_list.dart';
import 'package:tiptap_flutter/extensions/blockquote.dart';
import 'package:tiptap_flutter/extensions/subscript.dart';
import 'package:tiptap_flutter/extensions/superscript.dart';
import 'package:tiptap_flutter/extensions/highlight.dart';
import 'package:tiptap_flutter/tiptap_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiptap Parser Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tiptap Parser Demo'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Scrollbar(
              radius: const Radius.circular(8.0),
              child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TiptapRenderer(TiptapData.jsonData, extensions: [
                    DocumentExtension,
                    ParagraphExtension,
                    HeadingExtension,
                    TextExtension,
                    ItalicExtension,
                    BoldExtension,
                    UnderlineExtension,
                    StrikeExtension,
                    LinkExtension,
                    CodeExtension,
                    ImageExtension,
                    BulletListExtension,
                    OrderedListExtension,
                    ListItemExtension,
                    HardBreakExtension,
                    BlockquoteExtension,
                    SuperscriptExtension,
                    SubscriptExtension,
                    HighlightExtension
                      ..data = {
                        "colorAlias": {
                          "var(--p-primary-500)": "#2191f3",
                        },
                        "defaultColor": Colors.blue
                      },
                  ])),
            )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(height: 4),
            ),
            const Text('JSON Data:'),
            const Expanded(
              child: SingleChildScrollView(
                child: Text(TiptapData.stringData),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
