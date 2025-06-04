// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'env.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EnvConfig {
  String get appName => throw _privateConstructorUsedError;
  String get apiBaseUrl => throw _privateConstructorUsedError;
  bool get isDebug => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EnvConfigCopyWith<EnvConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvConfigCopyWith<$Res> {
  factory $EnvConfigCopyWith(EnvConfig value, $Res Function(EnvConfig) then) =
      _$EnvConfigCopyWithImpl<$Res, EnvConfig>;
  @useResult
  $Res call({String appName, String apiBaseUrl, bool isDebug});
}

/// @nodoc
class _$EnvConfigCopyWithImpl<$Res, $Val extends EnvConfig>
    implements $EnvConfigCopyWith<$Res> {
  _$EnvConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? apiBaseUrl = null,
    Object? isDebug = null,
  }) {
    return _then(_value.copyWith(
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      apiBaseUrl: null == apiBaseUrl
          ? _value.apiBaseUrl
          : apiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isDebug: null == isDebug
          ? _value.isDebug
          : isDebug // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnvConfigImplCopyWith<$Res>
    implements $EnvConfigCopyWith<$Res> {
  factory _$$EnvConfigImplCopyWith(
          _$EnvConfigImpl value, $Res Function(_$EnvConfigImpl) then) =
      __$$EnvConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String appName, String apiBaseUrl, bool isDebug});
}

/// @nodoc
class __$$EnvConfigImplCopyWithImpl<$Res>
    extends _$EnvConfigCopyWithImpl<$Res, _$EnvConfigImpl>
    implements _$$EnvConfigImplCopyWith<$Res> {
  __$$EnvConfigImplCopyWithImpl(
      _$EnvConfigImpl _value, $Res Function(_$EnvConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? apiBaseUrl = null,
    Object? isDebug = null,
  }) {
    return _then(_$EnvConfigImpl(
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      apiBaseUrl: null == apiBaseUrl
          ? _value.apiBaseUrl
          : apiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isDebug: null == isDebug
          ? _value.isDebug
          : isDebug // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EnvConfigImpl implements _EnvConfig {
  const _$EnvConfigImpl(
      {required this.appName, required this.apiBaseUrl, required this.isDebug});

  @override
  final String appName;
  @override
  final String apiBaseUrl;
  @override
  final bool isDebug;

  @override
  String toString() {
    return 'EnvConfig(appName: $appName, apiBaseUrl: $apiBaseUrl, isDebug: $isDebug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnvConfigImpl &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.apiBaseUrl, apiBaseUrl) ||
                other.apiBaseUrl == apiBaseUrl) &&
            (identical(other.isDebug, isDebug) || other.isDebug == isDebug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appName, apiBaseUrl, isDebug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnvConfigImplCopyWith<_$EnvConfigImpl> get copyWith =>
      __$$EnvConfigImplCopyWithImpl<_$EnvConfigImpl>(this, _$identity);
}

abstract class _EnvConfig implements EnvConfig {
  const factory _EnvConfig(
      {required final String appName,
      required final String apiBaseUrl,
      required final bool isDebug}) = _$EnvConfigImpl;

  @override
  String get appName;
  @override
  String get apiBaseUrl;
  @override
  bool get isDebug;
  @override
  @JsonKey(ignore: true)
  _$$EnvConfigImplCopyWith<_$EnvConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
