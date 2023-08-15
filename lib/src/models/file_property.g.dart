// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FileProperty _$$_FilePropertyFromJson(Map<String, dynamic> json) =>
    _$_FileProperty(
      path: json['path'] as String?,
      name: json['name'] as String?,
      id: json['id'] as int?,
      mimeType: json['mimeType'] as String?,
      dateAdded: json['dateAdded'] as int?,
      size: json['size'] as int?,
      bitMap: (json['bitMap'] as List<dynamic>?)?.map((e) => e as int).toList(),
      extension: json['extension'] as String?,
    );

Map<String, dynamic> _$$_FilePropertyToJson(_$_FileProperty instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('path', instance.path);
  writeNotNull('name', instance.name);
  writeNotNull('id', instance.id);
  writeNotNull('mimeType', instance.mimeType);
  writeNotNull('dateAdded', instance.dateAdded);
  writeNotNull('size', instance.size);
  writeNotNull('bitMap', instance.bitMap);
  writeNotNull('extension', instance.extension);
  return val;
}
