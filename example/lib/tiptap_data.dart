import 'dart:convert';

class TiptapData {
  static final Map<String, dynamic> jsonData = json.decode(stringData);
  static const String stringData = '''{
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
        },
        {
          "marks": [],
          "text": "",
          "type": "text"
        }
      ]
    },
    {
      "content": [
        {
          "marks": [],
          "text": "Testing inline links, ",
          "type": "text"
        },
        {
          "marks": [
            {
              "type": "bold"
            }
          ],
          "text": "so",
          "type": "text"
        },
        {
          "marks": [
            {
              "type": "bold"
            },
            {
              "type": "italic"
            }
          ],
          "text": " ",
          "type": "text"
        },
        {
          "marks": [
            {
              "type": "italic"
            },
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
          "text": "here's ",
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
          "text": "a ",
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
          "text": "link",
          "type": "text"
        },
        {
          "marks": [],
          "text": " inline",
          "type": "text"
        }
      ],
      "type": "paragraph"
    },
    {
      "content": [
        {
          "marks": [],
          "text": "telephone: ",
          "type": "text"
        },
        {
          "marks": [
            {
              "type": "link",
              "attrs": {
                "href": "tel:800-555-1212"
              }
            }
          ],
          "text": "800-555-1212",
          "type": "text"
        },
        {
          "marks": [],
          "text": "",
          "type": "text"
        }
      ],
      "type": "paragraph"
    },
    {
      "content": [
        {
          "marks": [],
          "text": "email: ",
          "type": "text"
        },
        {
          "marks": [
            {
              "type": "link",
              "attrs": {
                "href": "mailto:info@example.com"
              }
            }
          ],
          "text": "info@example.com",
          "type": "text"
        },
        {
          "marks": [],
          "text": "",
          "type": "text"
        }
      ],
      "type": "paragraph"
    }
  ]
 }''';
}
