// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  PomodoroTask? get currentTask => throw _privateConstructorUsedError;
  int get releaseTime => throw _privateConstructorUsedError;
  int get pomodoroCount => throw _privateConstructorUsedError;
  PomodoroState get state => throw _privateConstructorUsedError;
  Settings get settings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {PomodoroTask? currentTask,
      int releaseTime,
      int pomodoroCount,
      PomodoroState state,
      Settings settings});

  $SettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTask = freezed,
    Object? releaseTime = null,
    Object? pomodoroCount = null,
    Object? state = null,
    Object? settings = null,
  }) {
    return _then(_value.copyWith(
      currentTask: freezed == currentTask
          ? _value.currentTask
          : currentTask // ignore: cast_nullable_to_non_nullable
              as PomodoroTask?,
      releaseTime: null == releaseTime
          ? _value.releaseTime
          : releaseTime // ignore: cast_nullable_to_non_nullable
              as int,
      pomodoroCount: null == pomodoroCount
          ? _value.pomodoroCount
          : pomodoroCount // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PomodoroState,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SettingsCopyWith<$Res> get settings {
    return $SettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PomodoroTask? currentTask,
      int releaseTime,
      int pomodoroCount,
      PomodoroState state,
      Settings settings});

  @override
  $SettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTask = freezed,
    Object? releaseTime = null,
    Object? pomodoroCount = null,
    Object? state = null,
    Object? settings = null,
  }) {
    return _then(_$HomeStateImpl(
      currentTask: freezed == currentTask
          ? _value.currentTask
          : currentTask // ignore: cast_nullable_to_non_nullable
              as PomodoroTask?,
      releaseTime: null == releaseTime
          ? _value.releaseTime
          : releaseTime // ignore: cast_nullable_to_non_nullable
              as int,
      pomodoroCount: null == pomodoroCount
          ? _value.pomodoroCount
          : pomodoroCount // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PomodoroState,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.currentTask,
      required this.releaseTime,
      required this.pomodoroCount,
      required this.state,
      required this.settings});

  @override
  final PomodoroTask? currentTask;
  @override
  final int releaseTime;
  @override
  final int pomodoroCount;
  @override
  final PomodoroState state;
  @override
  final Settings settings;

  @override
  String toString() {
    return 'HomeState(currentTask: $currentTask, releaseTime: $releaseTime, pomodoroCount: $pomodoroCount, state: $state, settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.currentTask, currentTask) ||
                other.currentTask == currentTask) &&
            (identical(other.releaseTime, releaseTime) ||
                other.releaseTime == releaseTime) &&
            (identical(other.pomodoroCount, pomodoroCount) ||
                other.pomodoroCount == pomodoroCount) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, currentTask, releaseTime, pomodoroCount, state, settings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final PomodoroTask? currentTask,
      required final int releaseTime,
      required final int pomodoroCount,
      required final PomodoroState state,
      required final Settings settings}) = _$HomeStateImpl;

  @override
  PomodoroTask? get currentTask;
  @override
  int get releaseTime;
  @override
  int get pomodoroCount;
  @override
  PomodoroState get state;
  @override
  Settings get settings;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
