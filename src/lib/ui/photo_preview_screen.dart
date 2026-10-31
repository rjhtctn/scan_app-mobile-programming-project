import 'dart:io';
import 'package:flutter/material.dart';

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
            child: FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Yeniden çek'),
            ),
          )),
        ],
      ),
    );
  }
}
