const String paragraphJson = '''{
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

const String boldMarksJson = '''{
		"content": [
			{
				"content": [
					{
						"marks": [
              {
                "type": "bold"
              }
            ],
						"text": "This is a paragraph",
						"type": "text"
					}
				],
				"type": "paragraph"
			}
		],
		"type": "doc"
  }''';

const String boldItalicMarksJson = '''{
		"content": [
			{
				"content": [
					{
						"marks": [
              {
                "type": "bold"
              },
              {
                "type": "italic"
              }
            ],
						"text": "This is a paragraph",
						"type": "text"
					}
				],
				"type": "paragraph"
			}
		],
		"type": "doc"
  }''';

const String absentMarksJson = '''{
		"content": [
			{
				"content": [
					{
						"text": "This is a paragraph",
						"type": "text"
					}
				],
				"type": "paragraph"
			}
		],
		"type": "doc"
  }''';

const String orderedListJson = '''{
		"content": [
			{
				"content": [
					{
						"content": [
							{
								"content": [
									{
										"marks": [],
										"text": "Step one",
										"type": "text"
									}
								],
								"type": "paragraph"
							}
						],
						"type": "list-item"
					},
					{
						"content": [
							{
								"content": [
									{
										"marks": [],
										"text": "Step two",
										"type": "text"
									}
								],
								"type": "paragraph"
							}
						],
						"type": "list-item"
					},
					{
						"content": [
							{
								"content": [
									{
										"marks": [],
										"text": "Step three",
										"type": "text"
									}
								],
								"type": "paragraph"
							}
						],
						"type": "list-item"
					},
					{
						"content": [
							{
								"content": [
									{
										"marks": [],
										"text": "Step four",
										"type": "text"
									}
								],
								"type": "paragraph"
							}
						],
						"type": "list-item"
					}
				],
				"type": "ordered-list"
			},
			{
				"content": [
					{
						"marks": [],
						"text": "",
						"type": "text"
					}
				],
				"type": "paragraph"
			}
		],
		"type": "doc"
	}''';

const String unorderedListJson = '''{
		"content": [
			{
				"content": [
					{
						"content": [
							{
								"content": [
									{
										"marks": [],
										"text": "Step one",
										"type": "text"
									}
								],
								"type": "paragraph"
							}
						],
						"type": "list-item"
					},
					{
						"content": [
							{
								"content": [
									{
										"marks": [],
										"text": "Step two",
										"type": "text"
									}
								],
								"type": "paragraph"
							}
						],
						"type": "list-item"
					},
					{
						"content": [
							{
								"content": [
									{
										"marks": [],
										"text": "Step three",
										"type": "text"
									}
								],
								"type": "paragraph"
							}
						],
						"type": "list-item"
					},
					{
						"content": [
							{
								"content": [
									{
										"marks": [],
										"text": "Step four",
										"type": "text"
									}
								],
								"type": "paragraph"
							}
						],
						"type": "list-item"
					}
				],
				"type": "unordered-list"
			},
			{
				"content": [
					{
						"marks": [],
						"text": "",
						"type": "text"
					}
				],
				"type": "paragraph"
			}
		],
		"type": "doc"
	}''';

const String hrJson = '''{
      "content": [
        {
          "content": [
            {
              "marks": [],
              "type": "text",
              "text": "hello world"
            }
          ],
          "type": "paragraph"
        },
        {
          "content": [
            {
              "marks": [],
              "type": "text",
              "text": ""
            }
          ],
          "type": "hr"
        },
        {
          "content": [
            {
              "marks": [],
              "type": "text",
              "text": ""
            }
          ],
          "type": "paragraph"
        }
      ],
      "type": "doc"
  } ''';

const String headingJson = '''{
    "content": [
      {
        "content": [
          {
            "marks": [],
            "text": "test - heading 1",
            "type": "text"
          }
        ],
        "type": "heading",
        "attrs": {
          "level": 1
        }
      },
      {
        "content": [
          {
            "marks": [],
            "text": "test - heading 2",
            "type": "text"
          }
        ],
        "type": "heading",
        "attrs": {
          "level": 2
        }
      },
      {
        "content": [
          {
            "marks": [],
            "text": "test - heading 3",
            "type": "text"
          }
        ],
        "type": "heading",
        "attrs": {
          "level": 3
        }
      },
      {
        "content": [
          {
            "marks": [],
            "text": "test - heading 4",
            "type": "text"
          }
        ],
        "type": "heading",
        "attrs": {
          "level": 4
        }
      },
      {
        "content": [
          {
            "marks": [],
            "text": "test - heading 5",
            "type": "text"
          }
        ],
        "type": "heading",
        "attrs": {
          "level": 5
        }
      },
      {
        "content": [
          {
            "marks": [],
            "text": "test - heading 6",
            "type": "text"
          }
        ],
        "type": "heading",
        "attrs": {
          "level": 6
        }
      }
    ],
    "type": "doc"
  }''';

const String hyperlinkJson = '''{
      "content": [
        {
          "content": [
            {
              "type": "text",
              "text": "link",
              "marks": [
                {
                  "type": "link",
                  "attrs": {
                    "href": "https://url.org"
                  }
                }
              ]
            }
          ],
          "type": "heading",
          "attrs": {
            "level": 1
          }
        }
      ],
      "type": "doc"
    }''';

const String embeddedEntryJson = '''{
    "content": [
      {
        "type": "embedded-entry-block",
        "content": [],
        "data": {
          "target": {
            "sys": {
              "id": "999888",
              "type": "Link",
              "linkType": "Entry"
            }
          }
        }
      }
    ],
    "type": "doc"
  }
  ''';

const String quoteJson = '''{
    "content": [
      {
        "content": [
          {
            "marks": [],
            "text": "hello",
            "type": "text"
          }
        ],
        "type": "paragraph"
      },
      {
        "content": [
          {
            "marks": [],
            "text": "world",
            "type": "text"
          }
        ],
        "type": "blockquote"
      }
    ],
    "type": "doc"
  }''';

const String inlineAssetHyperlinkJson = '''{
    "content": [
      {
        "content": [
          {
            "marks": [],
            "text": "",
            "type": "text"
          },
          {
            "data": {
              "target": {
                "sys": {
                  "id": "9mpxT4zsRi6Iwukey8KeM",
                  "link": "Link",
                  "type": "Asset"
                }
              }
            },
            "content": [
              {
                "marks": [],
                "text": "",
                "type": "text"
              }
            ],
            "type": "asset-hyperlink"
          },
          {
            "marks": [],
            "text": "",
            "type": "text"
          }
        ],
        "type": "paragraph"
      }
    ],
    "type": "doc"
  }''';

const String inlineEntryHyperlinkJson = '''{
    "content": [
      {
        "content": [
          {
            "marks": [],
            "text": "",
            "type": "text"
          },
          {
            "data": {
              "target": {
                "sys": {
                  "id": "9mpxT4zsRi6Iwukey8KeM",
                  "link": "Link",
                  "type": "Entry"
                }
              }
            },
            "content": [
              {
                "marks": [],
                "text": "",
                "type": "text"
              }
            ],
            "type": "entry-hyperlink"
          },
          {
            "marks": [],
            "text": "",
            "type": "text"
          }
        ],
        "type": "paragraph"
      }
    ],
    "type": "doc"
  }''';

const String inlineEmbeddedEntryJson = '''{
    "content": [
      {
        "content": [
          {
            "marks": [],
            "text": "",
            "type": "text"
          },
          {
            "data": {
              "target": {
                "sys": {
                  "id": "9mpxT4zsRi6Iwukey8KeM",
                  "link": "Link",
                  "type": "Entry"
                }
              }
            },
            "content": [
              {
                "marks": [],
                "text": "one",
                "type": "text"
              }
            ],
            "type": "embedded-entry-inline"
          },
          {
            "marks": [],
            "text": "",
            "type": "text"
          }
        ],
        "type": "paragraph"
      }
    ],
    "type": "doc"
  }''';
