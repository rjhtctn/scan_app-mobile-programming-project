import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'photo_preview_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  String? _error;
  bool _capturing = false;

  @override
  void initState() {
    super.initState();
    _startCamera();
  }

  Future<void> _startCamera() async {
    try {
      final devices = await availableCameras();
      if (devices.isEmpty) throw Exception('Cihazda kamera bulunamadı');
      final selected = devices.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => devices.first,
      );
      final camera = CameraController(selected, ResolutionPreset.medium, enableAudio: false);
      await camera.initialize();
      if (!mounted) {
        await camera.dispose();
        return;
      }
      setState(() => _controller = camera);
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    }
  }

  Future<void> _capture() async {
    final camera = _controller;
    if (camera == null || _capturing) return;
    setState(() => _capturing = true);
    try {
      final file = await camera.takePicture();
      if (!mounted) return;
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => PhotoPreviewScreen(imagePath: file.path)),
      );
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Fotoğraf çekilemedi: $e')),
      );
    } finally {
      if (mounted) setState(() => _capturing = false);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final camera = _controller;
    return Scaffold(
      appBar: AppBar(title: const Text('Kamera')),
      body: _error != null
          ? Center(child: Text(_error!))
          : camera == null
              ? const Center(child: CircularProgressIndicator())
              : Center(child: CameraPreview(camera)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.large(
        onPressed: camera == null || _capturing ? null : _capture,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
