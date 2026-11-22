import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

/// Dörtgen seçiminin görüntü boyutundan bağımsız geometrik kontrolleri.
class CropGeometry {
  CropGeometry._();

  /// Köşeler sırasıyla dörtgenin çevresini izlemelidir.
  /// Çakışan, kesişen, içbükey ve görüntü dışındaki seçimler kabul edilmez.
  static bool isValidNormalized(List<ui.Offset> corners) {
    if (corners.length != 4) return false;

    for (final corner in corners) {
      if (!corner.dx.isFinite || !corner.dy.isFinite ||
          corner.dx < 0 || corner.dx > 1 ||
          corner.dy < 0 || corner.dy > 1) {
        return false;
      }
    }

    double? winding;
    var twiceArea = 0.0;
    for (var i = 0; i < corners.length; i++) {
      final a = corners[i];
      final b = corners[(i + 1) % corners.length];
      final c = corners[(i + 2) % corners.length];
      final cross = (b.dx - a.dx) * (c.dy - b.dy) -
          (b.dy - a.dy) * (c.dx - b.dx);

      // Çok dar açılar ve kenarların kesişmesi kırpma maskesini bozabilir.
      if (cross.abs() < 0.0001) return false;
      if (winding != null && cross * winding <= 0) return false;
      winding ??= cross;
      twiceArea += a.dx * b.dy - b.dx * a.dy;
    }

    return twiceArea.abs() / 2 >= 0.005;
  }
}

/// Seçilen dörtgenin dışını saydam bırakarak PNG üretir.
/// Perspektif düzeltme bu işlemin kapsamında değildir.
class ManualCrop {
  ManualCrop._();

  static Future<Uint8List> apply(
    String imagePath,
    List<ui.Offset> normalizedCorners,
  ) async {
    if (!CropGeometry.isValidNormalized(normalizedCorners)) {
      throw ArgumentError('Geçerli bir dörtgen alan seçin.');
    }

    final bytes = await File(imagePath).readAsBytes();
    final codec = await ui.instantiateImageCodec(bytes);
    ui.Image? image;
    try {
      final frame = await codec.getNextFrame();
      final ui.Image source = frame.image;
      image = source;

      final points = [
        for (final corner in normalizedCorners)
          ui.Offset(corner.dx * source.width, corner.dy * source.height),
      ];
      final minX = points
          .map((point) => point.dx)
          .reduce(math.min)
          .floor()
          .clamp(0, source.width - 1);
      final minY = points
          .map((point) => point.dy)
          .reduce(math.min)
          .floor()
          .clamp(0, source.height - 1);
      final maxX = points
          .map((point) => point.dx)
          .reduce(math.max)
          .ceil()
          .clamp(minX + 1, source.width);
      final maxY = points
          .map((point) => point.dy)
          .reduce(math.max)
          .ceil()
          .clamp(minY + 1, source.height);
      final width = maxX - minX;
      final height = maxY - minY;
      if (width < 8 || height < 8) {
        throw StateError('Seçili alan çok küçük.');
      }

      final area = List.generate(points.length, (i) {
        final a = points[i];
        final b = points[(i + 1) % points.length];
        return a.dx * b.dy - b.dx * a.dy;
      }).reduce((a, b) => a + b).abs() / 2;
      if (area < 64) throw StateError('Seçili alan çok küçük.');

      final recorder = ui.PictureRecorder();
      final canvas = ui.Canvas(recorder);
      final mask = ui.Path()
        ..addPolygon([
          for (final point in points)
            ui.Offset(point.dx - minX, point.dy - minY),
        ], true);
      canvas.clipPath(mask);
      canvas.drawImage(
        source,
        ui.Offset(-minX.toDouble(), -minY.toDouble()),
        ui.Paint(),
      );
      final picture = recorder.endRecording();
      try {
        final result = await picture.toImage(width, height);
        try {
          final data = await result.toByteData(format: ui.ImageByteFormat.png);
          if (data == null) throw StateError('Görsel kodlanamadı.');
          return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        } finally {
          result.dispose();
        }
      } finally {
        picture.dispose();
      }
    } finally {
      image?.dispose();
      codec.dispose();
    }
  }
}
