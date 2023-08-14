import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_property.freezed.dart';
part 'file_property.g.dart';

@freezed
class FileProperty with _$FileProperty {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory FileProperty({
    final String? path,
    final String? name,
    final int? id,
    final String? mimeType,
    final int? dateAdded,
    final int? size,
  }) = _FileProperty;

  factory FileProperty.fromJson(Map<String, dynamic> json) =>
      _$FilePropertyFromJson(json);
}
