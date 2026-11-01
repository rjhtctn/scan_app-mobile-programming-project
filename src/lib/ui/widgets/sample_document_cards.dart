import 'package:flutter/material.dart';

/// Veritabanı eklenene kadar kullanılacak, etkileşimsiz örnek belge kartları.
class SampleDocumentCards extends StatelessWidget {
  const SampleDocumentCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Card(child: ListTile(
          leading: Icon(Icons.picture_as_pdf_outlined),
          title: Text('Örnek belge'),
          subtitle: Text('Taslak görünüm — henüz kaydedilmedi'),
        )),
        Card(child: ListTile(
          leading: Icon(Icons.description_outlined),
          title: Text('İkinci belge'),
          subtitle: Text('Örnek veri'),
        )),
      ],
    );
  }
}
