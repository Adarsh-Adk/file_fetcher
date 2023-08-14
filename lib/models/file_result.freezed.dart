// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FileResult _$FileResultFromJson(Map<String, dynamic> json) {
  return _FileResult.fromJson(json);
}

/// @nodoc
mixin _$FileResult {
  List<FileProperty>? get results => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileResultCopyWith<FileResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileResultCopyWith<$Res> {
  factory $FileResultCopyWith(
          FileResult value, $Res Function(FileResult) then) =
      _$FileResultCopyWithImpl<$Res, FileResult>;
  @useResult
  $Res call({List<FileProperty>? results, String? error});
}

/// @nodoc
class _$FileResultCopyWithImpl<$Res, $Val extends FileResult>
    implements $FileResultCopyWith<$Res> {
  _$FileResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<FileProperty>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FileResultCopyWith<$Res>
    implements $FileResultCopyWith<$Res> {
  factory _$$_FileResultCopyWith(
          _$_FileResult value, $Res Function(_$_FileResult) then) =
      __$$_FileResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FileProperty>? results, String? error});
}

/// @nodoc
class __$$_FileResultCopyWithImpl<$Res>
    extends _$FileResultCopyWithImpl<$Res, _$_FileResult>
    implements _$$_FileResultCopyWith<$Res> {
  __$$_FileResultCopyWithImpl(
      _$_FileResult _value, $Res Function(_$_FileResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_FileResult(
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<FileProperty>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_FileResult implements _FileResult {
  const _$_FileResult({final List<FileProperty>? results, this.error})
      : _results = results;

  factory _$_FileResult.fromJson(Map<String, dynamic> json) =>
      _$$_FileResultFromJson(json);

  final List<FileProperty>? _results;
  @override
  List<FileProperty>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'FileResult(results: $results, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FileResult &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_results), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileResultCopyWith<_$_FileResult> get copyWith =>
      __$$_FileResultCopyWithImpl<_$_FileResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileResultToJson(
      this,
    );
  }
}

abstract class _FileResult implements FileResult {
  const factory _FileResult(
      {final List<FileProperty>? results, final String? error}) = _$_FileResult;

  factory _FileResult.fromJson(Map<String, dynamic> json) =
      _$_FileResult.fromJson;

  @override
  List<FileProperty>? get results;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_FileResultCopyWith<_$_FileResult> get copyWith =>
      throw _privateConstructorUsedError;
}
