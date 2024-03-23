import 'package:flutter_test/flutter_test.dart';
import 'package:tiptap_flutter/types/marks.dart';

void main() {
  test('should get block by index with [] operator', () {
    // Good request
    expect(MARKS.ITALIC[2], MARKS.UNDERLINE);
    // Bad request
    expect(MARKS.ITALIC[200], isNull);
  });

  test('should get block by key with [] operator', () {
    // Good request
    expect(MARKS.ITALIC['UNDERLINE'], MARKS.UNDERLINE);
    // Bad request
    expect(MARKS.ITALIC['MISSING'], isNull);
  });

  test('should get block by float with [] operator', () {
    // Bad request
    expect(MARKS.ITALIC[0.1], isNull);
  });

  test('should get block fromKey', () {
    // Good request
    expect(MARKS.fromKey('BOLD'), MARKS.BOLD);
    // Bad request
    expect(MARKS.fromKey('NOPE'), isNull);
  });

  test('should get block fromValue', () {
    // Good request
    expect(MARKS.fromValue('italic'), MARKS.ITALIC);
    // Bad request
    expect(MARKS.fromValue('not-here'), isNull);
  });

  test('should print', () {
    expect(MARKS.UNDERLINE.toString(), 'MARKS.UNDERLINE');
  });
}
