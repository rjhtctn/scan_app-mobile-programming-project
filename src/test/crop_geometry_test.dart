import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:paperless/scan/manual_crop.dart';

void main() {
  test('Dört köşeli geçerli seçim kabul edilir', () {
    final corners = [
      const Offset(0.05, 0.05),
      const Offset(0.95, 0.05),
      const Offset(0.95, 0.95),
      const Offset(0.05, 0.95),
    ];
    expect(CropGeometry.isValidNormalized(corners), isTrue);
  });

  test('Farklı en-boy oranları için normalize seçim geçerlidir', () {
    final corners = [
      const Offset(0.10, 0.05),
      const Offset(0.85, 0.15),
      const Offset(0.90, 0.90),
      const Offset(0.08, 0.80),
    ];
    expect(CropGeometry.isValidNormalized(corners), isTrue);
  });

  test('Kesişen kenarlar ve içbükey alan reddedilir', () {
    expect(CropGeometry.isValidNormalized([
      const Offset(0.1, 0.1),
      const Offset(0.9, 0.9),
      const Offset(0.9, 0.1),
      const Offset(0.1, 0.9),
    ]), isFalse);
    expect(CropGeometry.isValidNormalized([
      const Offset(0.1, 0.1),
      const Offset(0.9, 0.1),
      const Offset(0.4, 0.4),
      const Offset(0.1, 0.9),
    ]), isFalse);
  });

  test('Görüntü dışı ve çok küçük seçimler reddedilir', () {
    expect(CropGeometry.isValidNormalized([
      const Offset(-0.1, 0.1),
      const Offset(0.9, 0.1),
      const Offset(0.9, 0.9),
      const Offset(0.1, 0.9),
    ]), isFalse);
    expect(CropGeometry.isValidNormalized([
      const Offset(0.1, 0.1),
      const Offset(0.11, 0.1),
      const Offset(0.11, 0.11),
      const Offset(0.1, 0.11),
    ]), isFalse);
  });
}
