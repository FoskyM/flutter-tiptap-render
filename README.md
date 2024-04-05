# Tiptap Flutter

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
- LinkExtension
- ImageExtension

## Getting started
Add the package to your `pubspec.yaml` file.
```yaml
dependencies:
  tiptap_flutter:
    git:
      url: https://github.com/fvarano/tiptap-flutter.git
      ref: main # branch name
```

## Usage
Full example in the `/example` folder.

```dart
import 'package:flutter/material.dart';
import 'package:tiptap_flutter/tiptap_flutter.dart';

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
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TiptapRenderer(jsonData, extensions: [
                        DocumentExtension,
                        ParagraphExtension,
                        HeadingExtension,
                        TextExtension,
                        BoldExtension,
                      ])),
                )),
          ],
        ),
      ),
    );
  }
}
```

## Additional information
TODO
