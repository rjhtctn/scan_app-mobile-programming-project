import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:paperless/data/draft_store.dart';

void main() {
  test('PNG imzası doğru olan içerik tanınır', () {
    final bytes = Uint8List.fromList([137, 80, 78, 71, 13, 10, 26, 10, 0]);
    expect(DraftStore.hasPngSignature(bytes), isTrue);
  });

  test('Boş ve geçersiz görüntü içerikleri reddedilir', () {
    expect(DraftStore.hasPngSignature(Uint8List(0)), isFalse);
    expect(DraftStore.hasPngSignature(Uint8List.fromList([1, 2, 3])), isFalse);
  });
}
