// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FileQuery _$FileQueryFromJson(Map<String, dynamic> json) {
  return _FileQuery.fromJson(json);
}

/// @nodoc
mixin _$FileQuery {
  List<String>? get extensions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileQueryCopyWith<FileQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileQueryCopyWith<$Res> {
  factory $FileQueryCopyWith(FileQuery value, $Res Function(FileQuery) then) =
      _$FileQueryCopyWithImpl<$Res, FileQuery>;
  @useResult
  $Res call({List<String>? extensions});
}

/// @nodoc
class _$FileQueryCopyWithImpl<$Res, $Val extends FileQuery>
    implements $FileQueryCopyWith<$Res> {
  _$FileQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensions = freezed,
  }) {
    return _then(_value.copyWith(
      extensions: freezed == extensions
          ? _value.extensions
          : extensions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FileQueryCopyWith<$Res> implements $FileQueryCopyWith<$Res> {
  factory _$$_FileQueryCopyWith(
          _$_FileQuery value, $Res Function(_$_FileQuery) then) =
      __$$_FileQueryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String>? extensions});
}

/// @nodoc
class __$$_FileQueryCopyWithImpl<$Res>
    extends _$FileQueryCopyWithImpl<$Res, _$_FileQuery>
    implements _$$_FileQueryCopyWith<$Res> {
  __$$_FileQueryCopyWithImpl(
      _$_FileQuery _value, $Res Function(_$_FileQuery) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensions = freezed,
  }) {
    return _then(_$_FileQuery(
      extensions: freezed == extensions
          ? _value._extensions
          : extensions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_FileQuery implements _FileQuery {
  const _$_FileQuery({final List<String>? extensions})
      : _extensions = extensions;

  factory _$_FileQuery.fromJson(Map<String, dynamic> json) =>
      _$$_FileQueryFromJson(json);

  final List<String>? _extensions;
  @override
  List<String>? get extensions {
    final value = _extensions;
    if (value == null) return null;
    if (_extensions is EqualUnmodifiableListView) return _extensions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FileQuery(extensions: $extensions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FileQuery &&
            const DeepCollectionEquality()
                .equals(other._extensions, _extensions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_extensions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileQueryCopyWith<_$_FileQuery> get copyWith =>
      __$$_FileQueryCopyWithImpl<_$_FileQuery>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileQueryToJson(
      this,
    );
  }
}

abstract class _FileQuery implements FileQuery {
  const factory _FileQuery({final List<String>? extensions}) = _$_FileQuery;

  factory _FileQuery.fromJson(Map<String, dynamic> json) =
      _$_FileQuery.fromJson;

  @override
  List<String>? get extensions;
  @override
  @JsonKey(ignore: true)
  _$$_FileQueryCopyWith<_$_FileQuery> get copyWith =>
      throw _privateConstructorUsedError;
}
