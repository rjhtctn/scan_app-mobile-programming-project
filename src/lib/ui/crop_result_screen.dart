import 'dart:io';
import 'package:flutter/material.dart';

class CropResultScreen extends StatelessWidget {
  const CropResultScreen({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kırpma sonucu')),
      body: Column(children: [
        Expanded(child: Center(child: Image.file(
          File(imagePath),
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Kırpılmış görüntü dosyası açılamadı.'),
          ),
        ))),
        const Padding(
          padding: EdgeInsets.all(12),
          child: Text('Dört köşe ile kırpıldı. Perspektif düzeltme sonraki sürüme eklenecek.'),
        ),
        SafeArea(child: Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(width: double.infinity, child: FilledButton(
            onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
            child: const Text('Ana ekrana dön'),
          )),
        )),
      ]),
    );
  }
}
