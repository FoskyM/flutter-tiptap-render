import 'package:flutter_test/flutter_test.dart';
import 'package:tiptap_flutter/types/blocks.dart';

void main() {
  test('should get block by index with [] operator', () {
    // Good request
    expect(BLOCKS.DOCUMENT[2], BLOCKS.HEADING);
    // Bad request
    expect(BLOCKS.DOCUMENT[200], isNull);
  });

  test('should get block by key with [] operator', () {
    // Good request
    expect(BLOCKS.DOCUMENT['HEADING'], BLOCKS.HEADING);
    // Bad request
    expect(BLOCKS.DOCUMENT['MISSING'], isNull);
  });

  test('should get block by float with [] operator', () {
    // Bad request
    expect(BLOCKS.DOCUMENT[0.1], isNull);
  });

  test('should get block fromKey', () {
    // Good request
    expect(BLOCKS.fromKey('HEADING'), BLOCKS.HEADING);
    // Bad request
    expect(BLOCKS.fromKey('NOPE'), isNull);
  });

  test('should get block fromValue', () {
    // Good request
    expect(BLOCKS.fromValue('heading'), BLOCKS.HEADING);
    // Bad request
    expect(BLOCKS.fromValue('not-here'), isNull);
  });

  test('should print', () {
    expect(BLOCKS.HR.toString(), 'BLOCKS.HR');
  });
}
