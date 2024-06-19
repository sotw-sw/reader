import 'dart:io';

import 'package:path_provider/path_provider.dart';

String? _appDataDir;

Future<String> appDataDir() async {
  if (_appDataDir == null) {
    final d = await getApplicationSupportDirectory();
    _appDataDir = d.path;
  }
  return _appDataDir!;
}

Future<File> appDataFile(String filename,
    {String subdir = "", String extension = "json"}) async {
  final d = await appDataDir();
  final f = File("$d$subdir/$filename.$extension");
  await f.parent.create();
  return f;
}
