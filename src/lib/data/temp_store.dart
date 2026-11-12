import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class TempStore {
  TempStore._();

  static Future<String> copyShot(String originalPath) async {
    final root = await getTemporaryDirectory();
    final folder = Directory(p.join(root.path, 'scan_drafts'));
    await folder.create(recursive: true);
    final extension = p.extension(originalPath).isEmpty ? '.jpg' : p.extension(originalPath);
    final dest = p.join(folder.path, 'raw_${DateTime.now().microsecondsSinceEpoch}$extension');
    await File(originalPath).copy(dest);
    return dest;
  }
}
