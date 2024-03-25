import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tiptap_flutter/core/extension.dart';
import 'package:tiptap_flutter/tiptap_flutter.dart';

import 'sample_json.dart';

/*
  For full support, it might be worth porting all of the tests at
  https://github.com/contentful/rich-text/blob/master/packages/rich-text-html-renderer/src/__test__/index.test.ts
  over to this package
 */

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget _buildWidget(String json, {Extensions? extensions}) {
    return MaterialApp(
      home: TiptapRenderer(
        jsonDecode(json),
        extensions: extensions,
      ),
    );
  }

  testWidgets('should display paragraph', (WidgetTester tester) async {
    await tester.pumpWidget(_buildWidget(paragraphJson,
        extensions: [DocumentExtension, ParagraphExtension, TextExtension]));

    final finder = find.text('This is a paragraph');
    expect(finder, findsOneWidget);
    final widget = tester.widget(finder) as Text;
    final span = widget.textSpan?.getSpanForPosition(TextPosition(offset: 0));
    expect(span, isNotNull);
    expect(span?.style, isNull);
  });

  testWidgets('should handle missing marks element',
      (WidgetTester tester) async {
    await tester.pumpWidget(_buildWidget(absentMarksJson,
        extensions: [DocumentExtension, ParagraphExtension, TextExtension]));

    expect(find.text('This is a paragraph'), findsOneWidget);
  });

  testWidgets('should display bold marks', (WidgetTester tester) async {
    await tester.pumpWidget(_buildWidget(boldMarksJson, extensions: [
      DocumentExtension,
      ParagraphExtension,
      TextExtension,
      BoldExtension
    ]));

    final finder = find.text('This is a paragraph');
    expect(finder, findsOneWidget);
    final widget = tester.widget(finder) as Text;
    final span = widget.textSpan?.getSpanForPosition(TextPosition(offset: 0));
    expect(span?.style?.fontWeight, FontWeight.bold);
  });

  testWidgets('should display bold italics marks', (WidgetTester tester) async {
    await tester.pumpWidget(_buildWidget(boldItalicMarksJson, extensions: [
      DocumentExtension,
      ParagraphExtension,
      TextExtension,
      BoldExtension,
      ItalicExtension
    ]));

    final finder = find.text('This is a paragraph');
    expect(finder, findsOneWidget);
    final widget = tester.widget(finder) as Text;
    final span = widget.textSpan?.getSpanForPosition(TextPosition(offset: 0));
    expect(span?.style?.fontWeight, FontWeight.bold);
    expect(span?.style?.fontStyle, FontStyle.italic);
  });

  testWidgets('should display ordered list', (WidgetTester tester) async {
    await tester.pumpWidget(_buildWidget(orderedListJson));

    // Find the row for step one
    var finder =
        find.ancestor(of: find.text('Step one'), matching: find.byType(Row));
    expect(
        find.descendant(of: finder, matching: find.text('1.')), findsOneWidget);
    expect(find.descendant(of: finder, matching: find.text('Step one')),
        findsOneWidget);

    // Find the row for step two
    finder =
        find.ancestor(of: find.text('Step two'), matching: find.byType(Row));
    expect(
        find.descendant(of: finder, matching: find.text('2.')), findsOneWidget);
    expect(find.descendant(of: finder, matching: find.text('Step two')),
        findsOneWidget);

    // Find the row for step three
    finder =
        find.ancestor(of: find.text('Step three'), matching: find.byType(Row));
    expect(
        find.descendant(of: finder, matching: find.text('3.')), findsOneWidget);
    expect(find.descendant(of: finder, matching: find.text('Step three')),
        findsOneWidget);

    // Find the row for step four
    finder =
        find.ancestor(of: find.text('Step four'), matching: find.byType(Row));
    expect(
        find.descendant(of: finder, matching: find.text('4.')), findsOneWidget);
    expect(find.descendant(of: finder, matching: find.text('Step four')),
        findsOneWidget);
  });

  testWidgets('should display unordered list', (WidgetTester tester) async {
    await tester.pumpWidget(_buildWidget(unorderedListJson));

    // Find the row for step one
    var finder =
        find.ancestor(of: find.text('Step one'), matching: find.byType(Row));
    expect(
        find.descendant(of: finder, matching: find.text('•')), findsOneWidget);
    expect(find.descendant(of: finder, matching: find.text('Step one')),
        findsOneWidget);

    // Find the row for step two
    finder =
        find.ancestor(of: find.text('Step two'), matching: find.byType(Row));
    expect(
        find.descendant(of: finder, matching: find.text('•')), findsOneWidget);
    expect(find.descendant(of: finder, matching: find.text('Step two')),
        findsOneWidget);

    // Find the row for step three
    finder =
        find.ancestor(of: find.text('Step three'), matching: find.byType(Row));
    expect(
        find.descendant(of: finder, matching: find.text('•')), findsOneWidget);
    expect(find.descendant(of: finder, matching: find.text('Step three')),
        findsOneWidget);

    // Find the row for step four
    finder =
        find.ancestor(of: find.text('Step four'), matching: find.byType(Row));
    expect(
        find.descendant(of: finder, matching: find.text('•')), findsOneWidget);
    expect(find.descendant(of: finder, matching: find.text('Step four')),
        findsOneWidget);
  });

  testWidgets('should display horizontal rule', (WidgetTester tester) async {
    await tester.pumpWidget(_buildWidget(hrJson, extensions: [
      DocumentExtension,
      ParagraphExtension,
      TextExtension,
      HorizontalRuleExtension
    ]));

    expect(find.text('hello world'), findsOneWidget);
    expect(find.byType(HorizontalRuleWidget), findsOneWidget);
  });

  testWidgets('should display headings', (WidgetTester tester) async {
    await tester.pumpWidget(_buildWidget(headingJson, extensions: [
      DocumentExtension,
      ParagraphExtension,
      TextExtension,
      HeadingExtension
    ]));

    var finder = find.text('test - heading 1');
    expect(finder, findsOneWidget);
    var widget = tester.widget(finder) as Text;
    expect(widget.style?.fontWeight, FontWeight.bold);
    expect(widget.style?.fontSize, 27);

    finder = find.text('test - heading 2');
    expect(finder, findsOneWidget);
    widget = tester.widget(finder) as Text;
    expect(widget.style?.fontWeight, FontWeight.bold);
    expect(widget.style?.fontSize, 24);

    finder = find.text('test - heading 3');
    expect(finder, findsOneWidget);
    widget = tester.widget(finder) as Text;
    expect(widget.style?.fontWeight, FontWeight.bold);
    expect(widget.style?.fontSize, 21);

    finder = find.text('test - heading 4');
    expect(finder, findsOneWidget);
    widget = tester.widget(finder) as Text;
    expect(widget.style?.fontWeight, FontWeight.bold);
    expect(widget.style?.fontSize, 18);

    finder = find.text('test - heading 5');
    expect(finder, findsOneWidget);
    widget = tester.widget(finder) as Text;
    expect(widget.style?.fontWeight, FontWeight.bold);
    expect(widget.style?.fontSize, 15);

    finder = find.text('test - heading 6');
    expect(finder, findsOneWidget);
    widget = tester.widget(finder) as Text;
    expect(widget.style?.fontWeight, FontWeight.bold);
    expect(widget.style?.fontSize, 12);
  });

  testWidgets('should display hyperlink', (WidgetTester tester) async {
    var launched = false;
    final channel = MethodChannel('plugins.flutter.io/url_launcher');
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel,
        (call) async {
      expect(call.arguments['url'], 'https://url.org');
      if (call.method == 'canLaunch') {
        return true;
      }
      expect(call.method, 'launch');
      launched = true;
      return true;
    });

    await tester.pumpWidget(_buildWidget(hyperlinkJson, extensions: [
      DocumentExtension,
      ParagraphExtension,
      TextExtension,
      HeadingExtension,
      LinkExtension
    ]));

    final finder = find.text('link');
    expect(finder, findsOneWidget);

    // Verify that tapping on the link launches the URL
    await tester.tap(finder);
    await tester.pumpAndSettle();

    expect(launched, isTrue);
  });

  // TODO: Tests for node types yet to be implemented
  //  embedded entry
  //  quote
  //  inline asset hyperlink
  //  inline entry hyperlink

  testWidgets('should display quotes', (WidgetTester tester) async {
    await tester.pumpWidget(_buildWidget(quoteJson));

    expect(find.text('hello'), findsOneWidget);
    // TODO: This should return one widget when implemented
    expect(find.text('world'), findsNothing);

    // Currently Container is used as a placeholder for quotes
    expect(find.byType(Container), findsWidgets);
  });

  testWidgets('should display inline asset hyperlink',
      (WidgetTester tester) async {
    await tester.pumpWidget(_buildWidget(inlineAssetHyperlinkJson));

    // Currently Container is used as a placeholder for unimplemented inlines
    expect(find.byType(Container), findsWidgets);
  });

  testWidgets('should display inline entry hyperlink',
      (WidgetTester tester) async {
    await tester.pumpWidget(_buildWidget(inlineEntryHyperlinkJson));

    // Currently Container is used as a placeholder for unimplemented inlines
    expect(find.byType(Container), findsWidgets);
  });

  testWidgets('should display inline embedded entry',
      (WidgetTester tester) async {
    await tester.pumpWidget(_buildWidget(inlineEmbeddedEntryJson));

    expect(find.text('one'), findsOneWidget);
  });
}
