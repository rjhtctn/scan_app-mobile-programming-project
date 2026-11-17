import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class DraftStore {
  DraftStore._();

  static Future<Directory> _folder() async {
    final root = await getApplicationDocumentsDirectory();
    final folder = Directory(p.join(root.path, 'scan_drafts'));
    await folder.create(recursive: true);
    return folder;
  }

  static Future<String> saveCrop(Uint8List png) async {
    final folder = await _folder();
    final file = File(p.join(folder.path, 'crop_${DateTime.now().microsecondsSinceEpoch}.png'));
    await file.writeAsBytes(png, flush: true);
    return file.path;
  }

  static Future<List<File>> listCrops() async {
    final folder = await _folder();
    final files = await folder.list().where((f) => f is File && f.path.endsWith('.png')).cast<File>().toList();
    files.sort((a, b) => b.path.compareTo(a.path));
    return files;
  }
}
