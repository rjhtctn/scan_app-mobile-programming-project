import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

/// Dört köşeyi kullanarak seçilen alanı PNG şeffaf maskesiyle kırpar.
/// Bu sürüm perspektif düzeltmesi yapmaz; o işlem 8. haftanın kapsamındadır.
class ManualCrop {
  ManualCrop._();

  static Future<Uint8List> apply(String imagePath, List<ui.Offset> normalizedCorners) async {
    if (normalizedCorners.length != 4) {
      throw ArgumentError('Dört köşe gereklidir.');
    }
    final bytes = await File(imagePath).readAsBytes();
    final codec = await ui.instantiateImageCodec(bytes);
    final frame = await codec.getNextFrame();
    final image = frame.image;
    codec.dispose();
    try {
      final points = [
        for (final c in normalizedCorners)
          ui.Offset(c.dx * image.width, c.dy * image.height),
      ];
      final minX = points.map((p) => p.dx).reduce(math.min).floor().clamp(0, image.width - 1);
      final minY = points.map((p) => p.dy).reduce(math.min).floor().clamp(0, image.height - 1);
      final maxX = points.map((p) => p.dx).reduce(math.max).ceil().clamp(minX + 1, image.width);
      final maxY = points.map((p) => p.dy).reduce(math.max).ceil().clamp(minY + 1, image.height);
      final width = maxX - minX;
      final height = maxY - minY;
      if (width < 8 || height < 8) throw StateError('Seçili alan çok küçük.');
      final painter = ui.PictureRecorder();
      final canvas = ui.Canvas(painter);
      final path = ui.Path()..addPolygon([
        for (final p in points) ui.Offset(p.dx - minX, p.dy - minY),
      ], true);
      canvas.clipPath(path);
      canvas.drawImage(image, ui.Offset(-minX.toDouble(), -minY.toDouble()), ui.Paint());
      final picture = painter.endRecording();
      final cropped = await picture.toImage(width, height);
      picture.dispose();
      try {
        final data = await cropped.toByteData(format: ui.ImageByteFormat.png);
        if (data == null) throw StateError('Görsel kodlanamadı.');
        return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      } finally {
        cropped.dispose();
      }
    } finally {
      image.dispose();
    }
  }
}
