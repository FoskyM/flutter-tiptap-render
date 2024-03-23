import 'package:flutter_test/flutter_test.dart';
import 'package:tiptap_flutter/types/schema_constraints.dart';

void main() {
  test('should get block by index with [] operator', () {
    // Good request
    expect(TopLevelBlockEnum.HEADING[1], TopLevelBlockEnum.HEADING);
    // Bad request
    expect(TopLevelBlockEnum.HEADING[200], isNull);
  });

  test('should get block by key with [] operator', () {
    // Good request
    expect(TopLevelBlockEnum.HEADING['HEADING'], TopLevelBlockEnum.HEADING);
    // Bad request
    expect(TopLevelBlockEnum.HEADING['MISSING'], isNull);
  });

  test('should get block by float with [] operator', () {
    // Bad request
    expect(TopLevelBlockEnum.HEADING[0.1], isNull);
  });

  test('should get block fromKey', () {
    // Good request
    expect(TopLevelBlockEnum.fromKey('HEADING'), TopLevelBlockEnum.HEADING);
    // Bad request
    expect(TopLevelBlockEnum.fromKey('NOPE'), isNull);
  });

  test('should print', () {
    expect(
        TopLevelBlockEnum.PARAGRAPH.toString(), 'TopLevelBlockEnum.PARAGRAPH');
  });
}
