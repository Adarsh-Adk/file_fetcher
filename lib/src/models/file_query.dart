import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_query.freezed.dart';
part 'file_query.g.dart';

@freezed
class FileQuery with _$FileQuery {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)

  ///[extensions] :give required extensions in lower case
  ///eg: if you want files with mp4 extension give FileQuery(extension:[["mp4"]])
  ///
  ///
  ///[includeThumbNail] :if you want to return thumbnails in returned list of files give true,
  ///default value is false,
  ///This is an experimental feature and takes a lot of time and memory use with care
  ///
  ///
  ///[thumbNailSize] :use this to specify minimum size for thumbnail
  const factory FileQuery({
    final List<String>? extensions,
    @Default(false) final bool? includeThumbNail,
    @Default(120) final int? thumbNailSize,
  }) = _FileQuery;

  factory FileQuery.fromJson(Map<String, dynamic> json) =>
      _$FileQueryFromJson(json);
}
