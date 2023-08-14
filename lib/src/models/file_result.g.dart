// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FileResult _$$_FileResultFromJson(Map<String, dynamic> json) =>
    _$_FileResult(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => FileProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$_FileResultToJson(_$_FileResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  writeNotNull('error', instance.error);
  return val;
}
