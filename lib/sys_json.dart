import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sotw_reader/sys_fs.dart';

part 'sys_json.g.dart';

class Jsonable<T> {
  Jsonable();

  Map<String, dynamic> toJson() => {};
  T fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}

@JsonSerializable(explicitToJson: true)
class JsonFileable<T> extends Jsonable<T> {
  String filename = DateTime.now().microsecondsSinceEpoch.toString();
  final String subdir;

  JsonFileable({this.subdir = ""});

  Future<void> write() async {
    final f = await appDataFile(filename, subdir: subdir);
    debugPrint("write file = $f");
    final j = jsonEncode(toJson());
    await f.writeAsString(j, flush: true);
  }

  Future<T> load(String filename) async {
    final f = await appDataFile(filename, subdir: subdir);
    debugPrint("load file = $f");
    final raw = await f.readAsString();
    final j = jsonDecode(raw);
    return fromJson(j);
  }

  factory JsonFileable.fromJson(Map<String, dynamic> json) =>
      _$JsonFileableFromJson(json);
}
