// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 PomodoroTask get currentTask; int get releaseTime; int get breakTime; int get longBreakTime; int get pomodoroCount; PomodoroState get state;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.currentTask, currentTask) || other.currentTask == currentTask)&&(identical(other.releaseTime, releaseTime) || other.releaseTime == releaseTime)&&(identical(other.breakTime, breakTime) || other.breakTime == breakTime)&&(identical(other.longBreakTime, longBreakTime) || other.longBreakTime == longBreakTime)&&(identical(other.pomodoroCount, pomodoroCount) || other.pomodoroCount == pomodoroCount)&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,currentTask,releaseTime,breakTime,longBreakTime,pomodoroCount,state);

@override
String toString() {
  return 'HomeState(currentTask: $currentTask, releaseTime: $releaseTime, breakTime: $breakTime, longBreakTime: $longBreakTime, pomodoroCount: $pomodoroCount, state: $state)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 PomodoroTask currentTask, int releaseTime, int breakTime, int longBreakTime, int pomodoroCount, PomodoroState state
});


$PomodoroTaskCopyWith<$Res> get currentTask;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentTask = null,Object? releaseTime = null,Object? breakTime = null,Object? longBreakTime = null,Object? pomodoroCount = null,Object? state = null,}) {
  return _then(_self.copyWith(
currentTask: null == currentTask ? _self.currentTask : currentTask // ignore: cast_nullable_to_non_nullable
as PomodoroTask,releaseTime: null == releaseTime ? _self.releaseTime : releaseTime // ignore: cast_nullable_to_non_nullable
as int,breakTime: null == breakTime ? _self.breakTime : breakTime // ignore: cast_nullable_to_non_nullable
as int,longBreakTime: null == longBreakTime ? _self.longBreakTime : longBreakTime // ignore: cast_nullable_to_non_nullable
as int,pomodoroCount: null == pomodoroCount ? _self.pomodoroCount : pomodoroCount // ignore: cast_nullable_to_non_nullable
as int,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as PomodoroState,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PomodoroTaskCopyWith<$Res> get currentTask {
  
  return $PomodoroTaskCopyWith<$Res>(_self.currentTask, (value) {
    return _then(_self.copyWith(currentTask: value));
  });
}
}


/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({required this.currentTask, required this.releaseTime, required this.breakTime, required this.longBreakTime, required this.pomodoroCount, required this.state});
  

@override final  PomodoroTask currentTask;
@override final  int releaseTime;
@override final  int breakTime;
@override final  int longBreakTime;
@override final  int pomodoroCount;
@override final  PomodoroState state;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.currentTask, currentTask) || other.currentTask == currentTask)&&(identical(other.releaseTime, releaseTime) || other.releaseTime == releaseTime)&&(identical(other.breakTime, breakTime) || other.breakTime == breakTime)&&(identical(other.longBreakTime, longBreakTime) || other.longBreakTime == longBreakTime)&&(identical(other.pomodoroCount, pomodoroCount) || other.pomodoroCount == pomodoroCount)&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,currentTask,releaseTime,breakTime,longBreakTime,pomodoroCount,state);

@override
String toString() {
  return 'HomeState(currentTask: $currentTask, releaseTime: $releaseTime, breakTime: $breakTime, longBreakTime: $longBreakTime, pomodoroCount: $pomodoroCount, state: $state)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 PomodoroTask currentTask, int releaseTime, int breakTime, int longBreakTime, int pomodoroCount, PomodoroState state
});


@override $PomodoroTaskCopyWith<$Res> get currentTask;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentTask = null,Object? releaseTime = null,Object? breakTime = null,Object? longBreakTime = null,Object? pomodoroCount = null,Object? state = null,}) {
  return _then(_HomeState(
currentTask: null == currentTask ? _self.currentTask : currentTask // ignore: cast_nullable_to_non_nullable
as PomodoroTask,releaseTime: null == releaseTime ? _self.releaseTime : releaseTime // ignore: cast_nullable_to_non_nullable
as int,breakTime: null == breakTime ? _self.breakTime : breakTime // ignore: cast_nullable_to_non_nullable
as int,longBreakTime: null == longBreakTime ? _self.longBreakTime : longBreakTime // ignore: cast_nullable_to_non_nullable
as int,pomodoroCount: null == pomodoroCount ? _self.pomodoroCount : pomodoroCount // ignore: cast_nullable_to_non_nullable
as int,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as PomodoroState,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PomodoroTaskCopyWith<$Res> get currentTask {
  
  return $PomodoroTaskCopyWith<$Res>(_self.currentTask, (value) {
    return _then(_self.copyWith(currentTask: value));
  });
}
}

// dart format on
