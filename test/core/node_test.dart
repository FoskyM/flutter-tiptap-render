import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tiptap_flutter/tiptap_flutter.dart';

void main() {
  test('can parse text from paragraph', () {
    var json = '''{
		  "content": [
			  {
				  "content": [
					  {
						  "marks": [],
						  "text": "This is a paragraph",
						  "type": "text"
					  }
				  ],
				  "type": "paragraph"
			  }
		  ],
		  "type": "doc"
    }''';
    var expected = 'This is a paragraph';

    expect(TiptapRenderer.text(jsonDecode(json)), expected);
  });

  test('parse multiple paragraphs', () {
    var json = '''{
      "type": "doc",
      "content": [
        {
          "type": "paragraph",
          "content": [
            {
              "text": "This is a paragraph",
              "type": "text"
            }
          ]
        },
        {
          "type": "paragraph",
          "content": [
            {
              "text": "This is another paragraph",
              "type": "text"
            }
          ]
        }
      ]
    }''';
    var expected = 'This is a paragraph\nThis is another paragraph';

    expect(TiptapRenderer.text(jsonDecode(json)), expected);
  });

  test('parses more complex example', () {
    var json = '''{
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
              "text": "Testing ",
              "type": "text"
            },
            {
              "marks": [
                {
                  "type": "bold"
                },
                {
                  "type": "link",
                  "attrs": {
                    "href": "https://google.com"
                  }
                }
              ],
              "text": "Hyperlink",
              "type": "text"
            },
            {
              "marks": [
                {
                  "type": "italic"
                },
                {
                  "type": "link",
                  "attrs": {
                    "href": "https://google.com"
                  }
                }
              ],
              "text": " in",
              "type": "text"
            },
            {
              "marks": [
                {
                  "type": "link",
                  "attrs": {
                    "href": "https://google.com"
                  }
                }
              ],
              "text": " header",
              "type": "text"
            }
          ]
        }
      ]
    }''';
    var expected = 'Testing Hyperlink in header';

    expect(TiptapRenderer.text(jsonDecode(json)), expected);
  });
}
