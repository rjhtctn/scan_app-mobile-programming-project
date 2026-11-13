import 'dart:io';
import 'package:flutter/material.dart';

/// Manuel kırpma modülü sonraki haftanın geliştirmesidir.
class CropScreen extends StatelessWidget {
  const CropScreen({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fotoğrafı kullan')),
      body: Center(child: Image.file(File(imagePath))),
    );
  }
}
