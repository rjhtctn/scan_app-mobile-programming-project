import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

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
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Görsel açılamadı: $e')),
      );
    }
  }

  void _moveCorner(int index, Offset delta, Rect imageRect) {
    final p = _corners[index];
    setState(() {
      _corners[index] = Offset(
        (p.dx + delta.dx / imageRect.width).clamp(0.0, 1.0),
        (p.dy + delta.dy / imageRect.height).clamp(0.0, 1.0),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manuel kırpma')),
      body: Column(
        children: [
          Expanded(child: LayoutBuilder(builder: (context, constraints) {
            final imageSize = _imageSize;
            if (imageSize == null) return const Center(child: CircularProgressIndicator());
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
                child: Image.file(File(widget.imagePath), fit: BoxFit.fill),
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
              onPressed: () => Navigator.pop(context),
              child: const Text('İptal'),
            )),
            const SizedBox(width: 8),
            Expanded(child: OutlinedButton(
              onPressed: () => setState(() => _corners = List.of(_initial)),
              child: const Text('Sıfırla'),
            )),
            const SizedBox(width: 8),
            const Expanded(child: FilledButton(
              onPressed: null,
              child: Text('Uygula'),
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
