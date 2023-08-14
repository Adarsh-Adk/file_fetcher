// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FileProperty _$FilePropertyFromJson(Map<String, dynamic> json) {
  return _FileProperty.fromJson(json);
}

/// @nodoc
mixin _$FileProperty {
  String? get path => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get mimeType => throw _privateConstructorUsedError;
  int? get dateAdded => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilePropertyCopyWith<FileProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilePropertyCopyWith<$Res> {
  factory $FilePropertyCopyWith(
          FileProperty value, $Res Function(FileProperty) then) =
      _$FilePropertyCopyWithImpl<$Res, FileProperty>;
  @useResult
  $Res call(
      {String? path,
      String? name,
      int? id,
      String? mimeType,
      int? dateAdded,
      int? size});
}

/// @nodoc
class _$FilePropertyCopyWithImpl<$Res, $Val extends FileProperty>
    implements $FilePropertyCopyWith<$Res> {
  _$FilePropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = freezed,
    Object? name = freezed,
    Object? id = freezed,
    Object? mimeType = freezed,
    Object? dateAdded = freezed,
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      dateAdded: freezed == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as int?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilePropertyCopyWith<$Res>
    implements $FilePropertyCopyWith<$Res> {
  factory _$$_FilePropertyCopyWith(
          _$_FileProperty value, $Res Function(_$_FileProperty) then) =
      __$$_FilePropertyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? path,
      String? name,
      int? id,
      String? mimeType,
      int? dateAdded,
      int? size});
}

/// @nodoc
class __$$_FilePropertyCopyWithImpl<$Res>
    extends _$FilePropertyCopyWithImpl<$Res, _$_FileProperty>
    implements _$$_FilePropertyCopyWith<$Res> {
  __$$_FilePropertyCopyWithImpl(
      _$_FileProperty _value, $Res Function(_$_FileProperty) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = freezed,
    Object? name = freezed,
    Object? id = freezed,
    Object? mimeType = freezed,
    Object? dateAdded = freezed,
    Object? size = freezed,
  }) {
    return _then(_$_FileProperty(
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      dateAdded: freezed == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as int?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_FileProperty implements _FileProperty {
  const _$_FileProperty(
      {this.path,
      this.name,
      this.id,
      this.mimeType,
      this.dateAdded,
      this.size});

  factory _$_FileProperty.fromJson(Map<String, dynamic> json) =>
      _$$_FilePropertyFromJson(json);

  @override
  final String? path;
  @override
  final String? name;
  @override
  final int? id;
  @override
  final String? mimeType;
  @override
  final int? dateAdded;
  @override
  final int? size;

  @override
  String toString() {
    return 'FileProperty(path: $path, name: $name, id: $id, mimeType: $mimeType, dateAdded: $dateAdded, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FileProperty &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, path, name, id, mimeType, dateAdded, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilePropertyCopyWith<_$_FileProperty> get copyWith =>
      __$$_FilePropertyCopyWithImpl<_$_FileProperty>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilePropertyToJson(
      this,
    );
  }
}

abstract class _FileProperty implements FileProperty {
  const factory _FileProperty(
      {final String? path,
      final String? name,
      final int? id,
      final String? mimeType,
      final int? dateAdded,
      final int? size}) = _$_FileProperty;

  factory _FileProperty.fromJson(Map<String, dynamic> json) =
      _$_FileProperty.fromJson;

  @override
  String? get path;
  @override
  String? get name;
  @override
  int? get id;
  @override
  String? get mimeType;
  @override
  int? get dateAdded;
  @override
  int? get size;
  @override
  @JsonKey(ignore: true)
  _$$_FilePropertyCopyWith<_$_FileProperty> get copyWith =>
      throw _privateConstructorUsedError;
}
