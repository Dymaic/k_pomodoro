import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:k_pomodoro/features/pomodoro/domain/entities/pomodoro_task.dart';

part 'tasks_page_ui_state.freezed.dart';

@freezed
abstract class TasksPageUiState with _$TasksPageUiState {
  const factory TasksPageUiState({
    required bool isLoading,
    required bool isError,
    required String errorMessage,
    required List<PomodoroTask> tasks,
  }) = _TasksPageUiState;

  factory TasksPageUiState.initial() => const TasksPageUiState(
    isLoading: false,
    isError: false,
    errorMessage: '',
    tasks: [],
  );
}
