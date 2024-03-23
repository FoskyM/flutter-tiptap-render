const String paragraphJson = '''{
		"data": {},
		"content": [
			{
				"data": {},
				"content": [
					{
						"data": {},
						"marks": [],
						"value": "This is a paragraph",
						"nodeType": "text"
					}
				],
				"nodeType": "paragraph"
			}
		],
		"nodeType": "document"
  }''';

const String boldMarksJson = '''{
		"data": {},
		"content": [
			{
				"data": {},
				"content": [
					{
						"data": {},
						"marks": [
              {
                "type": "bold"
              }
            ],
						"value": "This is a paragraph",
						"nodeType": "text"
					}
				],
				"nodeType": "paragraph"
			}
		],
		"nodeType": "document"
  }''';

const String boldItalicMarksJson = '''{
		"data": {},
		"content": [
			{
				"data": {},
				"content": [
					{
						"data": {},
						"marks": [
              {
                "type": "bold"
              },
              {
                "type": "italic"
              }
            ],
						"value": "This is a paragraph",
						"nodeType": "text"
					}
				],
				"nodeType": "paragraph"
			}
		],
		"nodeType": "document"
  }''';

const String absentMarksJson = '''{
		"data": {},
		"content": [
			{
				"data": {},
				"content": [
					{
						"data": {},
						"value": "This is a paragraph",
						"nodeType": "text"
					}
				],
				"nodeType": "paragraph"
			}
		],
		"nodeType": "document"
  }''';

const String orderedListJson = '''{
		"data": {},
		"content": [
			{
				"data": {},
				"content": [
					{
						"data": {},
						"content": [
							{
								"data": {},
								"content": [
									{
										"data": {},
										"marks": [],
										"value": "Step one",
										"nodeType": "text"
									}
								],
								"nodeType": "paragraph"
							}
						],
						"nodeType": "list-item"
					},
					{
						"data": {},
						"content": [
							{
								"data": {},
								"content": [
									{
										"data": {},
										"marks": [],
										"value": "Step two",
										"nodeType": "text"
									}
								],
								"nodeType": "paragraph"
							}
						],
						"nodeType": "list-item"
					},
					{
						"data": {},
						"content": [
							{
								"data": {},
								"content": [
									{
										"data": {},
										"marks": [],
										"value": "Step three",
										"nodeType": "text"
									}
								],
								"nodeType": "paragraph"
							}
						],
						"nodeType": "list-item"
					},
					{
						"data": {},
						"content": [
							{
								"data": {},
								"content": [
									{
										"data": {},
										"marks": [],
										"value": "Step four",
										"nodeType": "text"
									}
								],
								"nodeType": "paragraph"
							}
						],
						"nodeType": "list-item"
					}
				],
				"nodeType": "ordered-list"
			},
			{
				"data": {},
				"content": [
					{
						"data": {},
						"marks": [],
						"value": "",
						"nodeType": "text"
					}
				],
				"nodeType": "paragraph"
			}
		],
		"nodeType": "document"
	}''';

const String unorderedListJson = '''{
		"data": {},
		"content": [
			{
				"data": {},
				"content": [
					{
						"data": {},
						"content": [
							{
								"data": {},
								"content": [
									{
										"data": {},
										"marks": [],
										"value": "Step one",
										"nodeType": "text"
									}
								],
								"nodeType": "paragraph"
							}
						],
						"nodeType": "list-item"
					},
					{
						"data": {},
						"content": [
							{
								"data": {},
								"content": [
									{
										"data": {},
										"marks": [],
										"value": "Step two",
										"nodeType": "text"
									}
								],
								"nodeType": "paragraph"
							}
						],
						"nodeType": "list-item"
					},
					{
						"data": {},
						"content": [
							{
								"data": {},
								"content": [
									{
										"data": {},
										"marks": [],
										"value": "Step three",
										"nodeType": "text"
									}
								],
								"nodeType": "paragraph"
							}
						],
						"nodeType": "list-item"
					},
					{
						"data": {},
						"content": [
							{
								"data": {},
								"content": [
									{
										"data": {},
										"marks": [],
										"value": "Step four",
										"nodeType": "text"
									}
								],
								"nodeType": "paragraph"
							}
						],
						"nodeType": "list-item"
					}
				],
				"nodeType": "unordered-list"
			},
			{
				"data": {},
				"content": [
					{
						"data": {},
						"marks": [],
						"value": "",
						"nodeType": "text"
					}
				],
				"nodeType": "paragraph"
			}
		],
		"nodeType": "document"
	}''';

const String hrJson = '''{
		"data": {},
      "content": [
        {
          "content": [
            {
              "marks": [],
              "nodeType": "text",
              "value": "hello world",
              "data": {}
            }
          ],
          "data": {},
          "nodeType": "paragraph"
        },
        {
          "content": [
            {
              "marks": [],
              "nodeType": "text",
              "value": "",
              "data": {}
            }
          ],
          "data": {},
          "nodeType": "hr"
        },
        {
          "content": [
            {
              "marks": [],
              "nodeType": "text",
              "value": "",
              "data": {}
            }
          ],
          "data": {},
          "nodeType": "paragraph"
        }
      ],
      "data": {},
      "nodeType": "document"
  } ''';

const String headingJson = '''{
    "data": {},
    "content": [
      {
        "data": {},
        "content": [
          {
            "data": {},
            "marks": [],
            "value": "test - heading 1",
            "nodeType": "text"
          }
        ],
        "nodeType": "heading-1"
      },
      {
        "data": {},
        "content": [
          {
            "data": {},
            "marks": [],
            "value": "test - heading 2",
            "nodeType": "text"
          }
        ],
        "nodeType": "heading-2"
      },
      {
        "data": {},
        "content": [
          {
            "data": {},
            "marks": [],
            "value": "test - heading 3",
            "nodeType": "text"
          }
        ],
        "nodeType": "heading-3"
      },
      {
        "data": {},
        "content": [
          {
            "data": {},
            "marks": [],
            "value": "test - heading 4",
            "nodeType": "text"
          }
        ],
        "nodeType": "heading-4"
      },
      {
        "data": {},
        "content": [
          {
            "data": {},
            "marks": [],
            "value": "test - heading 5",
            "nodeType": "text"
          }
        ],
        "nodeType": "heading-5"
      },
      {
        "data": {},
        "content": [
          {
            "data": {},
            "marks": [],
            "value": "test - heading 6",
            "nodeType": "text"
          }
        ],
        "nodeType": "heading-6"
      }
    ],
    "nodeType": "document"
  }''';

const String hyperlinkJson = '''{
      "data": {},
      "content": [
        {
          "data": {},
          "content": [
            {
              "nodeType": "hyperlink",
              "content": [
                {
                  "nodeType": "text",
                  "value": "link",
                  "marks": [],
                  "data": {}
                }
              ],
              "data": {
                "uri": "https://url.org"
              }
            }
          ],
          "nodeType": "heading-1"
        }
      ],
      "nodeType": "document"
    }''';

const String embeddedEntryJson = '''{
    "data": {},
    "content": [
      {
        "nodeType": "embedded-entry-block",
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
    "nodeType": "document"
  }
  ''';

const String quoteJson = '''{
    "data": {},
    "content": [
      {
        "data": {},
        "content": [
          {
            "data": {},
            "marks": [],
            "value": "hello",
            "nodeType": "text"
          }
        ],
        "nodeType": "paragraph"
      },
      {
        "data": {},
        "content": [
          {
            "data": {},
            "marks": [],
            "value": "world",
            "nodeType": "text"
          }
        ],
        "nodeType": "blockquote"
      }
    ],
    "nodeType": "document"
  }''';

const String inlineAssetHyperlinkJson = '''{
    "data": {},
    "content": [
      {
        "data": {},
        "content": [
          {
            "marks": [],
            "value": "",
            "nodeType": "text",
            "data": {}
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
                "value": "",
                "nodeType": "text",
                "data": {}
              }
            ],
            "nodeType": "asset-hyperlink"
          },
          {
            "marks": [],
            "value": "",
            "nodeType": "text",
            "data": {}
          }
        ],
        "nodeType": "paragraph"
      }
    ],
    "nodeType": "document"
  }''';

const String inlineEntryHyperlinkJson = '''{
    "data": {},
    "content": [
      {
        "data": {},
        "content": [
          {
            "marks": [],
            "value": "",
            "nodeType": "text",
            "data": {}
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
                "value": "",
                "nodeType": "text",
                "data": {}
              }
            ],
            "nodeType": "entry-hyperlink"
          },
          {
            "marks": [],
            "value": "",
            "nodeType": "text",
            "data": {}
          }
        ],
        "nodeType": "paragraph"
      }
    ],
    "nodeType": "document"
  }''';

const String inlineEmbeddedEntryJson = '''{
    "data": {},
    "content": [
      {
        "data": {},
        "content": [
          {
            "marks": [],
            "value": "",
            "nodeType": "text",
            "data": {}
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
                "value": "one",
                "nodeType": "text",
                "data": {}
              }
            ],
            "nodeType": "embedded-entry-inline"
          },
          {
            "marks": [],
            "value": "",
            "nodeType": "text",
            "data": {}
          }
        ],
        "nodeType": "paragraph"
      }
    ],
    "nodeType": "document"
  }''';

const String baseJson = '''{
  "type": "doc",
  "content": [
    {
      "type": "paragraph",
      "content": [
        {
          "text": "Storie virali",
          "type": "text",
          "marks": [
            {
              "type": "italic"
            },
            {
              "type": "link",
              "attrs": {
                "href": "https://www.treccani.it/magazine/atlante/speciali/Storie_virali/",
                "title": null
              }
            }
          ]
        },
        {
          "text": " ritorna e diventa ",
          "type": "text"
        },
        {
          "text": "Storie corali",
          "type": "text",
          "marks": [
            {
              "type": "italic"
            },
            {
              "type": "bold"
            }
          ]
        },
        {
          "text": ". Nella cornice di Diso, in provincia di Lecce, il nucleo della redazione si è ritrovato e ha considerato cosa buona e giusta riprendere la discussione e la riflessione critica sul tema della pandemia e delle sue implicazioni sul piano sociale, storico, antropologico, politico ed esperienziale, ora come allora, tra passato, presente e futuro...",
          "type": "text"
        }
      ]
    },
    {
      "type": "paragraph",
      "content": [
        {
          "text": "Continua a leggere",
          "type": "text",
          "marks": [
            {
              "type": "link",
              "attrs": {
                "href": "https://www.treccani.it/magazine/atlante/societa/Storie_Corali.html",
                "title": null
              }
            }
          ]
        },
        {
          "text": " >",
          "type": "text"
        }
      ]
    },
    {
      "type": "heading",
      "attrs": {
        "level": 5
      },
      "content": [
        {
          "text": "Crediti: Gennaro Leonardi Photos / Shutterstock.com",
          "type": "text"
        }
      ]
    }
  ]
}''';
