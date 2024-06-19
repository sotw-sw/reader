// Content Entry of Artifact.

import 'package:json_annotation/json_annotation.dart';

part 'artifact_content.g.dart';

enum Type { base64Image, text, unknown }

@JsonSerializable(explicitToJson: true)
class Content {
  final String content;
  final Type type;

  Content({this.content = "", this.type = Type.unknown});

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
