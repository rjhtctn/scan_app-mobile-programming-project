import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../scan/manual_crop.dart';
import '../data/draft_store.dart';
import 'crop_result_screen.dart';

class CropScreen extends StatefulWidget {
  const CropScreen({super.key, required this.imagePath});
  final String imagePath;

  @override
  State<CropScreen> createState() => _CropScreenState();
}

class _CropScreenState extends State<CropScreen> {
  static const _handleSize = 30.0;
  static const _initial = [
    Offset(0.05, 0.05), Offset(0.95, 0.05),
    Offset(0.95, 0.95), Offset(0.05, 0.95),
  ];
  List<Offset> _corners = List.of(_initial);
  Size? _imageSize;
  String? _imageError;
  bool _processing = false;

  @override
  void initState() {
    super.initState();
    _readImageSize();
  }

  Future<void> _readImageSize() async {
    try {
      final data = await File(widget.imagePath).readAsBytes();
      final codec = await ui.instantiateImageCodec(data);
      final frame = await codec.getNextFrame();
      final size = Size(frame.image.width.toDouble(), frame.image.height.toDouble());
      frame.image.dispose();
      codec.dispose();
      if (mounted) setState(() => _imageSize = size);
    } catch (e) {
      if (mounted) {
        setState(() => _imageError = 'Görsel açılamadı: $e');
      }
    }
  }

  void _moveCorner(int index, Offset delta, Rect imageRect) {
    if (_processing || imageRect.width <= 0 || imageRect.height <= 0) return;
    final point = _corners[index];
    final updated = List<Offset>.of(_corners);
    updated[index] = Offset(
      (point.dx + delta.dx / imageRect.width).clamp(0.0, 1.0),
      (point.dy + delta.dy / imageRect.height).clamp(0.0, 1.0),
    );
    // Sürükleme sırasında köşelerin birbirini geçmesini önle.
    if (!CropGeometry.isValidNormalized(updated)) return;
    setState(() => _corners = updated);
  }

  Future<void> _applyCrop() async {
    if (_processing) return;
    setState(() => _processing = true);
    try {
      final cropped = await ManualCrop.apply(widget.imagePath, _corners);
      final destination = await DraftStore.saveCrop(cropped);
      if (!mounted) return;
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => CropResultScreen(imagePath: destination)),
      );
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kırpma uygulanamadı: $e')),
      );
    } finally {
      if (mounted) setState(() => _processing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manuel kırpma')),
      body: Column(
        children: [
          Expanded(child: LayoutBuilder(builder: (context, constraints) {
            final imageSize = _imageSize;
            if (_imageError != null) {
              return Center(child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(_imageError!, textAlign: TextAlign.center),
              ));
            }
            if (imageSize == null) {
              return const Center(child: CircularProgressIndicator());
            }
            final scale = (constraints.maxWidth / imageSize.width) <
                    (constraints.maxHeight / imageSize.height)
                ? constraints.maxWidth / imageSize.width
                : constraints.maxHeight / imageSize.height;
            final shown = imageSize * scale;
            final rect = Rect.fromLTWH(
              (constraints.maxWidth - shown.width) / 2,
              (constraints.maxHeight - shown.height) / 2,
              shown.width, shown.height,
            );
            return Stack(children: [
              Positioned.fromRect(
                rect: rect,
                child: Image.file(
                  File(widget.imagePath),
                  fit: BoxFit.fill,
                  errorBuilder: (_, __, ___) => const Center(
                    child: Text('Görsel gösterilemiyor.'),
                  ),
                ),
              ),
              Positioned.fill(child: IgnorePointer(child: CustomPaint(
                painter: CropOverlayPainter(imageRect: rect, corners: _corners),
              ))),
              for (var i = 0; i < _corners.length; i++)
                Positioned(
                  left: rect.left + _corners[i].dx * rect.width - _handleSize/2,
                  top: rect.top + _corners[i].dy * rect.height - _handleSize/2,
                  width: _handleSize, height: _handleSize,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onPanUpdate: (d) => _moveCorner(i, d.delta, rect),
                    child: DecoratedBox(decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.teal, width: 3),
                    )),
                  ),
                ),
            ]);
          })),
          Padding(padding: const EdgeInsets.all(12), child: Row(children: [
            Expanded(child: OutlinedButton(
              onPressed: _processing ? null : () => Navigator.pop(context),
              child: const Text('İptal'),
            )),
            const SizedBox(width: 8),
            Expanded(child: OutlinedButton(
              onPressed: _processing ? null : () => setState(() => _corners = List.of(_initial)),
              child: const Text('Sıfırla'),
            )),
            const SizedBox(width: 8),
            Expanded(child: FilledButton(
              onPressed: _processing || _imageSize == null || _imageError != null
                  ? null
                  : _applyCrop,
              child: Text(_processing ? 'İşleniyor...' : 'Uygula'),
            )),
          ])),
        ],
      ),
    );
  }
}

class CropOverlayPainter extends CustomPainter {
  const CropOverlayPainter({required this.imageRect, required this.corners});
  final Rect imageRect;
  final List<Offset> corners;

  @override
  void paint(Canvas canvas, Size size) {
    final points = [
      for (final corner in corners)
        Offset(imageRect.left + corner.dx * imageRect.width,
            imageRect.top + corner.dy * imageRect.height),
    ];
    final path = Path()..addPolygon(points, true);
    canvas.drawPath(path, Paint()..color = Colors.teal.withValues(alpha: 0.20));
    canvas.drawPath(path, Paint()
      ..color = Colors.teal
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant CropOverlayPainter oldDelegate) => true;
}
