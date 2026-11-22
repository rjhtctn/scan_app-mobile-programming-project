import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class DraftStore {
  DraftStore._();

  static const _pngSignature = [137, 80, 78, 71, 13, 10, 26, 10];

  static Future<Directory> _folder() async {
    final root = await getApplicationDocumentsDirectory();
    final folder = Directory(p.join(root.path, 'scan_drafts'));
    await folder.create(recursive: true);
    return folder;
  }

  static bool hasPngSignature(Uint8List bytes) {
    if (bytes.length < _pngSignature.length) return false;
    for (var i = 0; i < _pngSignature.length; i++) {
      if (bytes[i] != _pngSignature[i]) return false;
    }
    return true;
  }

  static Future<String> saveCrop(Uint8List png) async {
    if (!hasPngSignature(png)) {
      throw const FormatException('PNG görüntü verisi geçersiz.');
    }
    final folder = await _folder();
    final fileName = 'crop_${DateTime.now().microsecondsSinceEpoch}.png';
    final destination = File(p.join(folder.path, fileName));
    final staging = File('${destination.path}.writing');

    try {
      await staging.writeAsBytes(png, flush: true);
      // Yarım yazılmış bir görüntü listeye alınmasın.
      await staging.rename(destination.path);
      return destination.path;
    } finally {
      if (await staging.exists()) await staging.delete();
    }
  }

  static Future<List<File>> listCrops() async {
    final folder = await _folder();
    final files = <File>[];
    await for (final entry in folder.list()) {
      if (entry is File &&
          p.basename(entry.path).startsWith('crop_') &&
          p.extension(entry.path).toLowerCase() == '.png') {
        files.add(entry);
      }
    }
    // Dosya adları zaman damgalı olduğundan son kaydedilen önce gelir.
    files.sort((a, b) => b.path.compareTo(a.path));
    return files;
  }
}
