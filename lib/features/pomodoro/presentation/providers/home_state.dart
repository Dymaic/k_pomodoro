import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:k_pomodoro/features/pomodoro/domain/entities/pomodoro_task.dart';
import 'package:k_pomodoro/features/pomodoro/enums/pomodoro_enum.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required PomodoroTask currentTask,
    required int releaseTime,
    required int breakTime,
    required int longBreakTime,
    required int pomodoroCount,
    required PomodoroState state,
  }) = _HomeState;
}
