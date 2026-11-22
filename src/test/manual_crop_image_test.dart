import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter_test/flutter_test.dart';
import 'package:paperless/scan/manual_crop.dart';

/// Basit bir renkli görüntü oluşturarak maske çıktısını dosya üzerinden sınar.
Future<Uint8List> _testImage() async {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  canvas.drawColor(const ui.Color(0xFF1976D2), ui.BlendMode.src);
  final picture = recorder.endRecording();
  try {
    final image = await picture.toImage(100, 100);
    try {
      final data = await image.toByteData(format: ui.ImageByteFormat.png);
      if (data == null) throw StateError('Test görüntüsü kodlanamadı.');
      return Uint8List.fromList(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      );
    } finally {
      image.dispose();
    }
  } finally {
    picture.dispose();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Seçilen dörtgenin dışında alfa sıfır, içinde alfa tamdır', () async {
    final folder = await Directory.systemTemp.createTemp('scan_crop_test_');
    final sourceFile = File('${folder.path}/test.png');
    try {
      await sourceFile.writeAsBytes(await _testImage());
      final result = await ManualCrop.apply(sourceFile.path, [
        const ui.Offset(0.30, 0.20),
        const ui.Offset(0.70, 0.20),
        const ui.Offset(0.90, 0.80),
        const ui.Offset(0.10, 0.80),
      ]);

      expect(DraftPngSignature.fromBytes(result), isTrue);
      final codec = await ui.instantiateImageCodec(result);
      try {
        final frame = await codec.getNextFrame();
        final image = frame.image;
        try {
          expect(image.width, 80);
          expect(image.height, 60);
          final rgba = await image.toByteData(
            format: ui.ImageByteFormat.rawRgba,
          );
          expect(rgba, isNotNull);
          // Üst sol nokta dörtgen dışında, orta nokta içindedir.
          expect(rgba!.getUint8(3), 0);
          expect(rgba.getUint8((30 * 80 + 40) * 4 + 3), 255);
        } finally {
          image.dispose();
        }
      } finally {
        codec.dispose();
      }
    } finally {
      await folder.delete(recursive: true);
    }
  });

  test('Geçersiz seçim dosya okunmadan reddedilir', () async {
    await expectLater(
      ManualCrop.apply('olmayan_gorsel.png', [
        const ui.Offset(0.1, 0.1),
        const ui.Offset(0.9, 0.9),
        const ui.Offset(0.9, 0.1),
        const ui.Offset(0.1, 0.9),
      ]),
      throwsArgumentError,
    );
  });
}

/// Görüntü çıktı formatını ek paket kullanmadan doğrulamak için PNG başlığı.
class DraftPngSignature {
  static bool fromBytes(Uint8List bytes) {
    const signature = <int>[137, 80, 78, 71, 13, 10, 26, 10];
    if (bytes.length < signature.length) return false;
    for (var i = 0; i < signature.length; i++) {
      if (bytes[i] != signature[i]) return false;
    }
    return true;
  }
}
