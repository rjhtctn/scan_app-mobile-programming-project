import 'dart:io';
import 'package:flutter/material.dart';
import 'crop_screen.dart';

class PhotoPreviewScreen extends StatelessWidget {
  const PhotoPreviewScreen({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fotoğraf önizleme')),
      body: Column(
        children: [
          Expanded(child: Center(child: Image.file(File(imagePath), fit: BoxFit.contain))),
          SafeArea(child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(children: [
              Expanded(child: OutlinedButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.replay),
                label: const Text('Yeniden çek'),
              )),
              const SizedBox(width: 12),
              Expanded(child: FilledButton.icon(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => CropScreen(imagePath: imagePath)),
                ),
                icon: const Icon(Icons.check),
                label: const Text('Fotoğrafı kullan'),
              )),
            ]),
          )),
        ],
      ),
    );
  }
}
