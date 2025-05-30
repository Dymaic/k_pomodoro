// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Settings {

 String get theme; String get locale; bool get notificationsEnabled; int get pomodoroDuration; int get shortBreakDuration; int get longBreakDuration; int get pomodoroCountBeforeLongBreak;
/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsCopyWith<Settings> get copyWith => _$SettingsCopyWithImpl<Settings>(this as Settings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Settings&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.pomodoroDuration, pomodoroDuration) || other.pomodoroDuration == pomodoroDuration)&&(identical(other.shortBreakDuration, shortBreakDuration) || other.shortBreakDuration == shortBreakDuration)&&(identical(other.longBreakDuration, longBreakDuration) || other.longBreakDuration == longBreakDuration)&&(identical(other.pomodoroCountBeforeLongBreak, pomodoroCountBeforeLongBreak) || other.pomodoroCountBeforeLongBreak == pomodoroCountBeforeLongBreak));
}


@override
int get hashCode => Object.hash(runtimeType,theme,locale,notificationsEnabled,pomodoroDuration,shortBreakDuration,longBreakDuration,pomodoroCountBeforeLongBreak);

@override
String toString() {
  return 'Settings(theme: $theme, locale: $locale, notificationsEnabled: $notificationsEnabled, pomodoroDuration: $pomodoroDuration, shortBreakDuration: $shortBreakDuration, longBreakDuration: $longBreakDuration, pomodoroCountBeforeLongBreak: $pomodoroCountBeforeLongBreak)';
}


}

/// @nodoc
abstract mixin class $SettingsCopyWith<$Res>  {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) _then) = _$SettingsCopyWithImpl;
@useResult
$Res call({
 String theme, String locale, bool notificationsEnabled, int pomodoroDuration, int shortBreakDuration, int longBreakDuration, int pomodoroCountBeforeLongBreak
});




}
/// @nodoc
class _$SettingsCopyWithImpl<$Res>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._self, this._then);

  final Settings _self;
  final $Res Function(Settings) _then;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? theme = null,Object? locale = null,Object? notificationsEnabled = null,Object? pomodoroDuration = null,Object? shortBreakDuration = null,Object? longBreakDuration = null,Object? pomodoroCountBeforeLongBreak = null,}) {
  return _then(_self.copyWith(
theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,pomodoroDuration: null == pomodoroDuration ? _self.pomodoroDuration : pomodoroDuration // ignore: cast_nullable_to_non_nullable
as int,shortBreakDuration: null == shortBreakDuration ? _self.shortBreakDuration : shortBreakDuration // ignore: cast_nullable_to_non_nullable
as int,longBreakDuration: null == longBreakDuration ? _self.longBreakDuration : longBreakDuration // ignore: cast_nullable_to_non_nullable
as int,pomodoroCountBeforeLongBreak: null == pomodoroCountBeforeLongBreak ? _self.pomodoroCountBeforeLongBreak : pomodoroCountBeforeLongBreak // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _Settings implements Settings {
  const _Settings({required this.theme, required this.locale, required this.notificationsEnabled, required this.pomodoroDuration, required this.shortBreakDuration, required this.longBreakDuration, required this.pomodoroCountBeforeLongBreak});
  

@override final  String theme;
@override final  String locale;
@override final  bool notificationsEnabled;
@override final  int pomodoroDuration;
@override final  int shortBreakDuration;
@override final  int longBreakDuration;
@override final  int pomodoroCountBeforeLongBreak;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsCopyWith<_Settings> get copyWith => __$SettingsCopyWithImpl<_Settings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Settings&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.pomodoroDuration, pomodoroDuration) || other.pomodoroDuration == pomodoroDuration)&&(identical(other.shortBreakDuration, shortBreakDuration) || other.shortBreakDuration == shortBreakDuration)&&(identical(other.longBreakDuration, longBreakDuration) || other.longBreakDuration == longBreakDuration)&&(identical(other.pomodoroCountBeforeLongBreak, pomodoroCountBeforeLongBreak) || other.pomodoroCountBeforeLongBreak == pomodoroCountBeforeLongBreak));
}


@override
int get hashCode => Object.hash(runtimeType,theme,locale,notificationsEnabled,pomodoroDuration,shortBreakDuration,longBreakDuration,pomodoroCountBeforeLongBreak);

@override
String toString() {
  return 'Settings(theme: $theme, locale: $locale, notificationsEnabled: $notificationsEnabled, pomodoroDuration: $pomodoroDuration, shortBreakDuration: $shortBreakDuration, longBreakDuration: $longBreakDuration, pomodoroCountBeforeLongBreak: $pomodoroCountBeforeLongBreak)';
}


}

/// @nodoc
abstract mixin class _$SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) _then) = __$SettingsCopyWithImpl;
@override @useResult
$Res call({
 String theme, String locale, bool notificationsEnabled, int pomodoroDuration, int shortBreakDuration, int longBreakDuration, int pomodoroCountBeforeLongBreak
});




}
/// @nodoc
class __$SettingsCopyWithImpl<$Res>
    implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(this._self, this._then);

  final _Settings _self;
  final $Res Function(_Settings) _then;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? theme = null,Object? locale = null,Object? notificationsEnabled = null,Object? pomodoroDuration = null,Object? shortBreakDuration = null,Object? longBreakDuration = null,Object? pomodoroCountBeforeLongBreak = null,}) {
  return _then(_Settings(
theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,pomodoroDuration: null == pomodoroDuration ? _self.pomodoroDuration : pomodoroDuration // ignore: cast_nullable_to_non_nullable
as int,shortBreakDuration: null == shortBreakDuration ? _self.shortBreakDuration : shortBreakDuration // ignore: cast_nullable_to_non_nullable
as int,longBreakDuration: null == longBreakDuration ? _self.longBreakDuration : longBreakDuration // ignore: cast_nullable_to_non_nullable
as int,pomodoroCountBeforeLongBreak: null == pomodoroCountBeforeLongBreak ? _self.pomodoroCountBeforeLongBreak : pomodoroCountBeforeLongBreak // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
