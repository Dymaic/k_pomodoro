// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pomodoro_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PomodoroTask {

 String get id; String get title; String get description; DateTime get createdAt; DateTime get updatedAt; int get pomodoroCount; int get completedPomodoros; bool get isActive;
/// Create a copy of PomodoroTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PomodoroTaskCopyWith<PomodoroTask> get copyWith => _$PomodoroTaskCopyWithImpl<PomodoroTask>(this as PomodoroTask, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PomodoroTask&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.pomodoroCount, pomodoroCount) || other.pomodoroCount == pomodoroCount)&&(identical(other.completedPomodoros, completedPomodoros) || other.completedPomodoros == completedPomodoros)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,createdAt,updatedAt,pomodoroCount,completedPomodoros,isActive);

@override
String toString() {
  return 'PomodoroTask(id: $id, title: $title, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, pomodoroCount: $pomodoroCount, completedPomodoros: $completedPomodoros, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $PomodoroTaskCopyWith<$Res>  {
  factory $PomodoroTaskCopyWith(PomodoroTask value, $Res Function(PomodoroTask) _then) = _$PomodoroTaskCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, DateTime createdAt, DateTime updatedAt, int pomodoroCount, int completedPomodoros, bool isActive
});




}
/// @nodoc
class _$PomodoroTaskCopyWithImpl<$Res>
    implements $PomodoroTaskCopyWith<$Res> {
  _$PomodoroTaskCopyWithImpl(this._self, this._then);

  final PomodoroTask _self;
  final $Res Function(PomodoroTask) _then;

/// Create a copy of PomodoroTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? createdAt = null,Object? updatedAt = null,Object? pomodoroCount = null,Object? completedPomodoros = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,pomodoroCount: null == pomodoroCount ? _self.pomodoroCount : pomodoroCount // ignore: cast_nullable_to_non_nullable
as int,completedPomodoros: null == completedPomodoros ? _self.completedPomodoros : completedPomodoros // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _PomodoroTask implements PomodoroTask {
  const _PomodoroTask({required this.id, required this.title, required this.description, required this.createdAt, required this.updatedAt, required this.pomodoroCount, required this.completedPomodoros, required this.isActive});
  

@override final  String id;
@override final  String title;
@override final  String description;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int pomodoroCount;
@override final  int completedPomodoros;
@override final  bool isActive;

/// Create a copy of PomodoroTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PomodoroTaskCopyWith<_PomodoroTask> get copyWith => __$PomodoroTaskCopyWithImpl<_PomodoroTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PomodoroTask&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.pomodoroCount, pomodoroCount) || other.pomodoroCount == pomodoroCount)&&(identical(other.completedPomodoros, completedPomodoros) || other.completedPomodoros == completedPomodoros)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,createdAt,updatedAt,pomodoroCount,completedPomodoros,isActive);

@override
String toString() {
  return 'PomodoroTask(id: $id, title: $title, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, pomodoroCount: $pomodoroCount, completedPomodoros: $completedPomodoros, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$PomodoroTaskCopyWith<$Res> implements $PomodoroTaskCopyWith<$Res> {
  factory _$PomodoroTaskCopyWith(_PomodoroTask value, $Res Function(_PomodoroTask) _then) = __$PomodoroTaskCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, DateTime createdAt, DateTime updatedAt, int pomodoroCount, int completedPomodoros, bool isActive
});




}
/// @nodoc
class __$PomodoroTaskCopyWithImpl<$Res>
    implements _$PomodoroTaskCopyWith<$Res> {
  __$PomodoroTaskCopyWithImpl(this._self, this._then);

  final _PomodoroTask _self;
  final $Res Function(_PomodoroTask) _then;

/// Create a copy of PomodoroTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? createdAt = null,Object? updatedAt = null,Object? pomodoroCount = null,Object? completedPomodoros = null,Object? isActive = null,}) {
  return _then(_PomodoroTask(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,pomodoroCount: null == pomodoroCount ? _self.pomodoroCount : pomodoroCount // ignore: cast_nullable_to_non_nullable
as int,completedPomodoros: null == completedPomodoros ? _self.completedPomodoros : completedPomodoros // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
