import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'piece.g.dart';

@JsonSerializable(explicitToJson: true)
class Piece {
  final String name;
  final String author;
  final String hash;
  List<String> artifacts;

  Piece({this.name = "name", this.author = "author"})
      : hash = sha256.convert(utf8.encode("$name-$author")).toString(),
        artifacts = [];
}
