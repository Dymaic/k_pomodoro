// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'env.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EnvConfig {

 String get appName; String get apiBaseUrl; bool get isDebug;
/// Create a copy of EnvConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnvConfigCopyWith<EnvConfig> get copyWith => _$EnvConfigCopyWithImpl<EnvConfig>(this as EnvConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnvConfig&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.apiBaseUrl, apiBaseUrl) || other.apiBaseUrl == apiBaseUrl)&&(identical(other.isDebug, isDebug) || other.isDebug == isDebug));
}


@override
int get hashCode => Object.hash(runtimeType,appName,apiBaseUrl,isDebug);

@override
String toString() {
  return 'EnvConfig(appName: $appName, apiBaseUrl: $apiBaseUrl, isDebug: $isDebug)';
}


}

/// @nodoc
abstract mixin class $EnvConfigCopyWith<$Res>  {
  factory $EnvConfigCopyWith(EnvConfig value, $Res Function(EnvConfig) _then) = _$EnvConfigCopyWithImpl;
@useResult
$Res call({
 String appName, String apiBaseUrl, bool isDebug
});




}
/// @nodoc
class _$EnvConfigCopyWithImpl<$Res>
    implements $EnvConfigCopyWith<$Res> {
  _$EnvConfigCopyWithImpl(this._self, this._then);

  final EnvConfig _self;
  final $Res Function(EnvConfig) _then;

/// Create a copy of EnvConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appName = null,Object? apiBaseUrl = null,Object? isDebug = null,}) {
  return _then(_self.copyWith(
appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,apiBaseUrl: null == apiBaseUrl ? _self.apiBaseUrl : apiBaseUrl // ignore: cast_nullable_to_non_nullable
as String,isDebug: null == isDebug ? _self.isDebug : isDebug // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _EnvConfig implements EnvConfig {
  const _EnvConfig({required this.appName, required this.apiBaseUrl, required this.isDebug});
  

@override final  String appName;
@override final  String apiBaseUrl;
@override final  bool isDebug;

/// Create a copy of EnvConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnvConfigCopyWith<_EnvConfig> get copyWith => __$EnvConfigCopyWithImpl<_EnvConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnvConfig&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.apiBaseUrl, apiBaseUrl) || other.apiBaseUrl == apiBaseUrl)&&(identical(other.isDebug, isDebug) || other.isDebug == isDebug));
}


@override
int get hashCode => Object.hash(runtimeType,appName,apiBaseUrl,isDebug);

@override
String toString() {
  return 'EnvConfig(appName: $appName, apiBaseUrl: $apiBaseUrl, isDebug: $isDebug)';
}


}

/// @nodoc
abstract mixin class _$EnvConfigCopyWith<$Res> implements $EnvConfigCopyWith<$Res> {
  factory _$EnvConfigCopyWith(_EnvConfig value, $Res Function(_EnvConfig) _then) = __$EnvConfigCopyWithImpl;
@override @useResult
$Res call({
 String appName, String apiBaseUrl, bool isDebug
});




}
/// @nodoc
class __$EnvConfigCopyWithImpl<$Res>
    implements _$EnvConfigCopyWith<$Res> {
  __$EnvConfigCopyWithImpl(this._self, this._then);

  final _EnvConfig _self;
  final $Res Function(_EnvConfig) _then;

/// Create a copy of EnvConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appName = null,Object? apiBaseUrl = null,Object? isDebug = null,}) {
  return _then(_EnvConfig(
appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,apiBaseUrl: null == apiBaseUrl ? _self.apiBaseUrl : apiBaseUrl // ignore: cast_nullable_to_non_nullable
as String,isDebug: null == isDebug ? _self.isDebug : isDebug // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
