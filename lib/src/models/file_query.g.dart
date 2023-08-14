// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FileQuery _$$_FileQueryFromJson(Map<String, dynamic> json) => _$_FileQuery(
      extensions: (json['extensions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_FileQueryToJson(_$_FileQuery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('extensions', instance.extensions);
  return val;
}
