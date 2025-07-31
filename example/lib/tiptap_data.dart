import 'dart:convert';

class TiptapData {
  static final Map<String, dynamic> jsonData = json.decode(stringData);
  static const String stringData = '''{
            "type": "doc",
            "content": [
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "text": "asdsa",
                            "type": "text"
                        }
                    ]
                },
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "text": "asdsad",
                            "type": "text",
                            "marks": [
                                {
                                    "type": "bold"
                                }
                            ]
                        }
                    ]
                },
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "text": "sadsadsa",
                            "type": "text",
                            "marks": [
                                {
                                    "type": "italic"
                                }
                            ]
                        }
                    ]
                },
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "text": "sadsa",
                            "type": "text",
                            "marks": [
                                {
                                    "type": "underline"
                                }
                            ]
                        }
                    ]
                },
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "text": "sadsad",
                            "type": "text",
                            "marks": [
                                {
                                    "type": "strike"
                                }
                            ]
                        }
                    ]
                },
                {
                    "type": "heading",
                    "attrs": {
                        "level": 1
                    },
                    "content": [
                        {
                            "text": "sadasda",
                            "type": "text"
                        }
                    ]
                },
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "text": "sadasd",
                            "type": "text",
                            "marks": [
                                {
                                    "type": "superscript"
                                }
                            ]
                        }
                    ]
                },
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "text": "asdasd",
                            "type": "text",
                            "marks": [
                                {
                                    "type": "subscript"
                                }
                            ]
                        }
                    ]
                },
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "text": "asdsada",
                            "type": "text",
                            "marks": [
                                {
                                    "type": "highlight",
                                    "attrs": {
                                        "color": "var(--p-primary-500)"
                                    }
                                }
                            ]
                        }
                    ]
                },
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "text": "asdsad",
                            "type": "text",
                            "marks": [
                                {
                                    "type": "code"
                                }
                            ]
                        }
                    ]
                },
                {
                    "type": "blockquote",
                    "content": [
                        {
                            "type": "paragraph",
                            "content": [
                                {
                                    "text": "asdasd",
                                    "type": "text"
                                }
                            ]
                        }
                    ]
                },
                {
                    "type": "orderedList",
                    "attrs": {
                        "type": null,
                        "start": 1
                    },
                    "content": [
                        {
                            "type": "listItem",
                            "content": [
                                {
                                    "type": "paragraph",
                                    "content": [
                                        {
                                            "text": "sadsadsa",
                                            "type": "text"
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            "type": "listItem",
                            "content": [
                                {
                                    "type": "paragraph",
                                    "content": [
                                        {
                                            "text": "sadsa",
                                            "type": "text"
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            "type": "listItem",
                            "content": [
                                {
                                    "type": "paragraph",
                                    "content": [
                                        {
                                            "text": "sadsa",
                                            "type": "text"
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                },
                {
                    "type": "bulletList",
                    "content": [
                        {
                            "type": "listItem",
                            "content": [
                                {
                                    "type": "paragraph",
                                    "content": [
                                        {
                                            "text": "asdsa",
                                            "type": "text"
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            "type": "listItem",
                            "content": [
                                {
                                    "type": "paragraph",
                                    "content": [
                                        {
                                            "text": "sad",
                                            "type": "text"
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            "type": "listItem",
                            "content": [
                                {
                                    "type": "paragraph",
                                    "content": [
                                        {
                                            "text": "asdsadsa",
                                            "type": "text"
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                },
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "text": "https://tiptap.dev/",
                            "type": "text",
                            "marks": [
                                {
                                    "type": "link",
                                    "attrs": {
                                        "rel": "noopener noreferrer nofollow",
                                        "href": "https://tiptap.dev/",
                                        "class": null,
                                        "target": "_blank"
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }''';
}
