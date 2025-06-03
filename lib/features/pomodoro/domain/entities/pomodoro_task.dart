
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pomodoro_task.freezed.dart';

@freezed
abstract class PomodoroTask with _$PomodoroTask {
  const factory PomodoroTask({
    required String id,
    required String title,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int pomodoroCount,
    required int completedPomodoros,
    required bool isActive,
  }) = _PomodoroTask;

  factory PomodoroTask.empty() => PomodoroTask(
        id: '',
        title: '',
        description: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        pomodoroCount: 0,
        completedPomodoros: 0,
        isActive: false,
      );

}