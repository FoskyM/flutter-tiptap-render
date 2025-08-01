# Flutter Tiptap Render

This project is a heavily modified version of the original, with additional extensions and architectural changes, which is based on work by Federico Varano (2024), licensed under the MIT License.

Original: [fvarano/tiptap-flutter](https://github.com/fvarano/tiptap-flutter)

## Features

- Parse JSON data to Flutter widgets
- Customizable extensions

### Built in extensions

- DocumentExtension
- ParagraphExtension
- HeadingExtension
- TextExtension
- BoldExtension
- ItalicExtension
- UnderlineExtension
- StrikeExtension
- LinkExtension
- CodeExtension (inline-code)
- ImageExtension
- BulletListExtension
- OrderedListExtension
- ListItemExtension
- HardBreakExtension
- BlockquoteExtension
- SuperscriptExtension
- SubscriptExtension
- HighlightExtension
- HorizontalRuleExtension

## Getting started

Add the package to your `pubspec.yaml` file.

```yaml
dependencies:
  flutter_tiptap_render:
    git:
      url: https://github.com/FoskyM/flutter_tiptap_render.git
      ref: main # branch name
```

## Usage

Full example in the `/example` folder.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_tiptap_render/flutter_tiptap_render.dart';

void main() => runApp(const MyApp());

const jsonData = '''{
  "type": "doc",
  "content": [
    {
      "type": "heading",
      "attrs": {
        "level": 1
      },
      "content": [
        {
          "marks": [],
          "text": "This is a header",
          "type": "text"
        },
      ]
    },
    {
      "content": [
        {
          "marks": [],
          "text": "This is a paragraph with ",
          "type": "text"
        },
        {
          "marks": [
            {
              "type": "bold"
            }
          ],
          "text": "important content",
          "type": "text"
        }
      ],
      "type": "paragraph"
    }
  ]
 }''';


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
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TiptapRenderer(jsonData, extensions: [
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
                              "colorAlias": {"var(--p-primary-500)": "#2191f3"},
                              "defaultColor": Theme.of(context).primaryColor,
                            },
                      ])),
                )),
          ],
        ),
      ),
    );
  }
}
```
