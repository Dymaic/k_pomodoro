import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';

@freezed
abstract class Settings with _$Settings {
  const factory Settings({
    required String theme,
    required String locale,
    required bool notificationsEnabled,
    required int pomodoroDuration,
    required int shortBreakDuration,
    required int longBreakDuration,
    required int pomodoroCountBeforeLongBreak,
    required bool isAutoStartPomodoro,
    required bool isAutoStartBreak,
  }) = _Settings;

  factory Settings.defaultSettings() => Settings(
    theme: 'light',
    locale: 'en_US',
    notificationsEnabled: true,
    pomodoroDuration: 25,
    shortBreakDuration: 5,
    longBreakDuration: 15,
    pomodoroCountBeforeLongBreak: 4,
    isAutoStartPomodoro: false,
    isAutoStartBreak: false
  );
}
