import 'package:freezed_annotation/freezed_annotation.dart';

import 'file_property.dart';

part 'file_result.freezed.dart';
part 'file_result.g.dart';

@freezed
class FileResult with _$FileResult {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory FileResult({
    final List<FileProperty>? results,
    final String? error,
  }) = _FileResult;

  factory FileResult.fromJson(Map<String, dynamic> json) =>
      _$FileResultFromJson(json);
}
