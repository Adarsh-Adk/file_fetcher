import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_property.freezed.dart';
part 'file_property.g.dart';

@freezed
class FileProperty with _$FileProperty {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)

  ///Lists the property of the returned file.
  ///
  ///[path] returns path to the file.
  ///
  /// [name] returns name of the file.
  ///
  /// [id] returns the idea of the file.
  ///
  /// [mime] returns the mimetype of the file.
  ///
  /// [dateAdded] returns the DATE_ADDED of the file
  ///
  /// [size] returns the size of the file in bytes
  ///
  /// [bitMap] returns data for thumbnail in List<int> please convert to Uint8list and use with Image.fromMemory
  ///
  /// [extension] returns the extension of file
  const factory FileProperty({
    ///path to the file
    final String? path,

    ///name of the file
    final String? name,

    ///id of the file
    final int? id,

    ///mime type of the file
    final String? mimeType,

    ///added date of the file
    final int? dateAdded,

    ///File size in bytes
    final int? size,

    ///returns data for thumbnail in List<int> please convert to Uint8list and use with Image.fromMemory
    final List<int>? bitMap,

    ///returns the extension of file
    final String? extension,
  }) = _FileProperty;

  factory FileProperty.fromJson(Map<String, dynamic> json) =>
      _$FilePropertyFromJson(json);
}
