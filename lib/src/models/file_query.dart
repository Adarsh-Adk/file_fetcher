import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_query.freezed.dart';
part 'file_query.g.dart';

@freezed
class FileQuery with _$FileQuery {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory FileQuery({
    final List<String>? extensions,
  }) = _FileQuery;

  factory FileQuery.fromJson(Map<String, dynamic> json) =>
      _$FileQueryFromJson(json);
}
