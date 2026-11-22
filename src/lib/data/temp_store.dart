import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class TempStore {
  TempStore._();

  static Future<Directory> _folder() async {
    final root = await getTemporaryDirectory();
    final folder = Directory(p.join(root.path, 'scan_drafts'));
    await folder.create(recursive: true);
    return folder;
  }

  static Future<void> _removeStaleShots(Directory folder) async {
    final oldestAllowed = DateTime.now().subtract(const Duration(days: 7));
    await for (final entry in folder.list()) {
      if (entry is! File || !p.basename(entry.path).startsWith('raw_')) {
        continue;
      }
      try {
        if ((await entry.lastModified()).isBefore(oldestAllowed)) {
          await entry.delete();
        }
      } on FileSystemException {
        // Eski dosyalar temizlenemese de yeni çekim engellenmez.
      }
    }
  }

  static Future<String> copyShot(String originalPath) async {
    final folder = await _folder();
    await _removeStaleShots(folder);
    final extension = p.extension(originalPath).isEmpty
        ? '.jpg'
        : p.extension(originalPath).toLowerCase();
    final destination = p.join(
      folder.path,
      'raw_${DateTime.now().microsecondsSinceEpoch}$extension',
    );
    await File(originalPath).copy(destination);
    return destination;
  }
}
