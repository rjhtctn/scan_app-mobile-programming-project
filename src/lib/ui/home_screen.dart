import 'package:flutter/material.dart';
import 'camera_screen.dart';
import 'widgets/sample_document_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Akıllı Belge Tarayıcı')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.document_scanner_outlined, size: 70, color: Colors.teal),
            const SizedBox(height: 20),
            const Text('Belgelerim', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const SampleDocumentCards(),
            const Spacer(),
            FilledButton.icon(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CameraScreen()),
              ),
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text('Yeni tarama'),
            ),
          ],
        ),
      ),
    );
  }
}
