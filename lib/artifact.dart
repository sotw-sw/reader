// Chapter of book or image of Comic
import 'package:json_annotation/json_annotation.dart';
import 'package:sotw_reader/sys_json.dart';
import 'artifact_content.dart';

part 'artifact.g.dart';

@JsonSerializable(explicitToJson: true)
class Artifact extends JsonFileable<Artifact> {
  final String uri;
  final String name;
  List<Content> contents = [];
  Map<String, dynamic> meta = {};

  Artifact({this.uri = "uri", this.name = "name"});

  factory Artifact.fromJson(Map<String, dynamic> json) =>
      _$ArtifactFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ArtifactToJson(this);

  @override
  Artifact fromJson(Map<String, dynamic> json) {
    return _$ArtifactFromJson(json);
  }

  @override
  String get subdir => "/artifacts";
}
