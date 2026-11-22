import 'dart:io';
import 'package:flutter/material.dart';
import '../data/draft_store.dart';
import 'camera_screen.dart';
import 'crop_result_screen.dart';
import 'widgets/sample_document_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<File> _drafts = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadDrafts();
  }

  Future<void> _loadDrafts() async {
    try {
      final drafts = await DraftStore.listCrops();
      if (mounted) setState(() { _drafts = drafts; _loading = false; });
    } catch (e) {
      if (mounted) {
        setState(() => _loading = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Taslaklar yüklenemedi: $e')));
      }
    }
  }

  Future<void> _openCamera() async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CameraScreen()));
    if (mounted) await _loadDrafts();
  }

  Future<void> _openDraft(File draft) async {
    if (!await draft.exists()) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Taslak dosyası bulunamadı.')),
      );
      await _loadDrafts();
      return;
    }
    if (!mounted) return;
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => CropResultScreen(imagePath: draft.path),
    ));
    if (mounted) await _loadDrafts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Akıllı Belge Tarayıcı')),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        const Image(image: AssetImage('assets/logo.png'), width: 72, height: 72),
        const SizedBox(height: 12),
        const Text('Belgelerim', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        const SampleDocumentCards(),
        const SizedBox(height: 20),
        const Text('Kırpma taslakları', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        if (_loading) const Center(child: CircularProgressIndicator()),
        if (!_loading && _drafts.isEmpty)
          const Padding(padding: EdgeInsets.all(16), child: Text('Henüz kırpılmış bir taslak yok.')),
        for (final draft in _drafts)
          Card(child: ListTile(
            leading: Image.file(
              draft,
              width: 52,
              height: 52,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.broken_image_outlined),
            ),
            title: const Text('Kırpılmış belge'),
            subtitle: const Text('Cihazda saklanan PNG taslağı'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _openDraft(draft),
          )),
        const SizedBox(height: 20),
        FilledButton.icon(
          onPressed: _openCamera,
          icon: const Icon(Icons.camera_alt_outlined),
          label: const Text('Yeni tarama'),
        ),
      ]),
    );
  }
}
