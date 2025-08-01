import 'package:example/tiptap_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiptap_render/extensions/bullet_list.dart';
import 'package:flutter_tiptap_render/extensions/hard_break.dart';
import 'package:flutter_tiptap_render/extensions/list_item.dart';
import 'package:flutter_tiptap_render/extensions/ordered_list.dart';
import 'package:flutter_tiptap_render/extensions/blockquote.dart';
import 'package:flutter_tiptap_render/extensions/subscript.dart';
import 'package:flutter_tiptap_render/extensions/superscript.dart';
import 'package:flutter_tiptap_render/extensions/highlight.dart';
import 'package:flutter_tiptap_render/flutter_tiptap_render.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiptap Renderer Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tiptap Renderer Demo'),
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
                    ParagraphExtension..data = {"top": 4.0, "bottom": 4.0},
                    HeadingExtension..data = {"top": 4.0},
                    TextExtension,
                    ItalicExtension,
                    BoldExtension,
                    UnderlineExtension,
                    StrikeExtension,
                    LinkExtension,
                    CodeExtension,
                    ImageExtension,
                    BulletListExtension..data = {"top": 0.0, "bottom": 0.0},
                    OrderedListExtension..data = {"top": 0.0, "bottom": 0.0},
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
