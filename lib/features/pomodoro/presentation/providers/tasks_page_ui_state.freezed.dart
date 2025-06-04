// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_page_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TasksPageUiState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<PomodoroTask> get tasks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TasksPageUiStateCopyWith<TasksPageUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksPageUiStateCopyWith<$Res> {
  factory $TasksPageUiStateCopyWith(
          TasksPageUiState value, $Res Function(TasksPageUiState) then) =
      _$TasksPageUiStateCopyWithImpl<$Res, TasksPageUiState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      String errorMessage,
      List<PomodoroTask> tasks});
}

/// @nodoc
class _$TasksPageUiStateCopyWithImpl<$Res, $Val extends TasksPageUiState>
    implements $TasksPageUiStateCopyWith<$Res> {
  _$TasksPageUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? errorMessage = null,
    Object? tasks = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<PomodoroTask>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TasksPageUiStateImplCopyWith<$Res>
    implements $TasksPageUiStateCopyWith<$Res> {
  factory _$$TasksPageUiStateImplCopyWith(_$TasksPageUiStateImpl value,
          $Res Function(_$TasksPageUiStateImpl) then) =
      __$$TasksPageUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      String errorMessage,
      List<PomodoroTask> tasks});
}

/// @nodoc
class __$$TasksPageUiStateImplCopyWithImpl<$Res>
    extends _$TasksPageUiStateCopyWithImpl<$Res, _$TasksPageUiStateImpl>
    implements _$$TasksPageUiStateImplCopyWith<$Res> {
  __$$TasksPageUiStateImplCopyWithImpl(_$TasksPageUiStateImpl _value,
      $Res Function(_$TasksPageUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? errorMessage = null,
    Object? tasks = null,
  }) {
    return _then(_$TasksPageUiStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<PomodoroTask>,
    ));
  }
}

/// @nodoc

class _$TasksPageUiStateImpl implements _TasksPageUiState {
  const _$TasksPageUiStateImpl(
      {required this.isLoading,
      required this.isError,
      required this.errorMessage,
      required final List<PomodoroTask> tasks})
      : _tasks = tasks;

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final String errorMessage;
  final List<PomodoroTask> _tasks;
  @override
  List<PomodoroTask> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TasksPageUiState(isLoading: $isLoading, isError: $isError, errorMessage: $errorMessage, tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksPageUiStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError, errorMessage,
      const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksPageUiStateImplCopyWith<_$TasksPageUiStateImpl> get copyWith =>
      __$$TasksPageUiStateImplCopyWithImpl<_$TasksPageUiStateImpl>(
          this, _$identity);
}

abstract class _TasksPageUiState implements TasksPageUiState {
  const factory _TasksPageUiState(
      {required final bool isLoading,
      required final bool isError,
      required final String errorMessage,
      required final List<PomodoroTask> tasks}) = _$TasksPageUiStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  String get errorMessage;
  @override
  List<PomodoroTask> get tasks;
  @override
  @JsonKey(ignore: true)
  _$$TasksPageUiStateImplCopyWith<_$TasksPageUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
