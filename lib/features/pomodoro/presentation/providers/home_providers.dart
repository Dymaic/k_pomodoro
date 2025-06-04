import 'dart:async';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_pomodoro/core/constants/app_constants.dart';
import 'package:k_pomodoro/features/pomodoro/domain/entities/pomodoro_task.dart';
import 'package:k_pomodoro/features/pomodoro/domain/entities/settings.dart';
import 'package:k_pomodoro/features/pomodoro/enums/pomodoro_enum.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/providers/home_state.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/providers/setting_providers.dart';

/// StateNotifier that manages the Pomodoro timer state and functionality
/// Handles timer operations, state transitions, and break management
class HomeStateNotifyProvider extends StateNotifier<HomeState?> {
  /// Initialize with default Pomodoro settings
  /// Default work session: 25 minutes, idle state
  HomeStateNotifyProvider(Settings settings) : super(null) {
    state = HomeState(
      currentTask: null, // No task selected initially
      releaseTime: settings.pomodoroDuration, // Default to 25 minutes
      pomodoroCount: 0, // Number of completed pomodoros
      state: PomodoroState.idle, // Initial state is idle
      settings: settings,
    );
  }

  /// Timer instance for countdown functionality
  /// Null when timer is not active
  Timer? _timer;

  /// Start a new Pomodoro work session
  /// Only works when current state is idle
  void startPomodoro() {
    if (state != null &&
        (state!.state == PomodoroState.idle ||
            state!.state == PomodoroState.pause ||
            state!.state == PomodoroState.breakComplete)) {
      // Change state to running
      state = state!.copyWith(state: PomodoroState.running);

      // Start countdown with work completion logic
      _startCountdownTimer(() {
        // Work session completed, transition to completion state
        state = state!.copyWith(
          state: PomodoroState.runningComplete,
          releaseTime: 0,
          pomodoroCount: state!.pomodoroCount + 1, // Increment count
        );
        if (state!.settings.isAutoStartBreak) {
          // Automatically start break if enabled in settings
          startBreak();
        }
      });
    }
  }

  /// Pause the currently running Pomodoro timer
  /// Only works when timer is currently running
  void pausePomodoro() {
    if (state != null && state!.state == PomodoroState.running) {
      // Change state to paused
      state = state!.copyWith(state: PomodoroState.pause);
      // Stop the timer
      _stopCountdownTimer();
    }
  }

  /// Resume a paused Pomodoro timer
  /// Only works when timer is currently paused
  void resumePomodoro() {
    if (state != null && state!.state == PomodoroState.pause) {
      // Change state back to running
      state = state!.copyWith(state: PomodoroState.running);

      // Resume countdown with work completion logic
      _startCountdownTimer(() {
        // Work session completed, transition to completion state
        state = state!.copyWith(
          state: PomodoroState.runningComplete,
          pomodoroCount: state!.pomodoroCount + 1, // Increment count
          releaseTime: 0,
        );
        if (state!.settings.isAutoStartBreak) {
          // Automatically start break if enabled in settings
          startBreak();
        }
      });
    }
  }

  /// Reset the Pomodoro timer to initial state
  /// Cancels any active timer and resets all values to default
  void resetPomodoro() {
    if (state != null) {
      // Cancel any active timer
      _stopCountdownTimer();
      // Reset to initial state with default values
      state = state!.copyWith(
        currentTask: null,
        releaseTime: _defaultPomodoroDuration, // Reset to 25 minutes
        pomodoroCount: 0,
        state: PomodoroState.idle,
      );
    }
  }

  /// Set the current task for the Pomodoro session
  /// Updates the task without affecting timer state
  void setCurrentTask(PomodoroTask task) {
    if (state != null) {
      state = state!.copyWith(currentTask: task);
    }
  }

  /// Set the break time for short breaks
  /// Updates the break time without affecting current timer state
  void startBreak() {
    if (state == null || state!.state != PomodoroState.runningComplete) {
      return; // No state initialized
    }

    if (state!.pomodoroCount == _defaultLongBreakPomodoroCount) {
      // If 4 pomodoros completed, start long break
      state = state!.copyWith(
        state: PomodoroState.longBreak,
        releaseTime: _defaultLongBreakDuration,
      );
    } else {
      // Otherwise, start short break
      state = state!.copyWith(
        state: PomodoroState.shortBreak,
        releaseTime: _defaultShortBreakDuration,
      );
    }
    _startCountdownTimer(() {
      // Break completed, return to break complete state
      final pomodoroCount = state!.state == PomodoroState.longBreak
          ? 0
          : state!.pomodoroCount;
      state = state!.copyWith(
        state: PomodoroState.breakComplete,
        pomodoroCount: pomodoroCount,
        releaseTime: _defaultPomodoroDuration, // Reset to default pomodoro time
      );
      if (state!.settings.isAutoStartPomodoro) {
        // Automatically start new Pomodoro if enabled in settings
        startPomodoro();
      }
    });
  }

  /// Skip the current break and return to running state
  void skipBreak() {
    if (state != null &&
        (state!.state == PomodoroState.shortBreak ||
            state!.state == PomodoroState.longBreak)) {
      _stopCountdownTimer();
      // Skip the break and return to idle state
      final pomodoroCount = state!.state == PomodoroState.longBreak
          ? 0
          : state!.pomodoroCount;
      state = state!.copyWith(
        state: PomodoroState.breakComplete,
        pomodoroCount: pomodoroCount,
        releaseTime: _defaultPomodoroDuration, // Reset to default pomodoro time
      );
      startPomodoro();
    }
  }

  /// Update settings for the Pomodoro timer
  void updateSettings(Settings settings) {
    if (state != null) {
      // Update break times based on settings
      state = state!.copyWith(settings: settings);
      switch (state!.state) {
        case PomodoroState.idle:
        case PomodoroState.breakComplete:
          state = state!.copyWith(releaseTime: settings.pomodoroDuration);
          break;
        case PomodoroState.runningComplete:
          if (state!.pomodoroCount >=
              state!.settings.pomodoroCountBeforeLongBreak) {
            state = state!.copyWith(releaseTime: settings.longBreakDuration);
          } else {
            state = state!.copyWith(releaseTime: settings.shortBreakDuration);
          }
          break;
        default:
          break;
      }
    }
  }

  void _stopCountdownTimer() {
    _timer?.cancel();
    _timer = null; // Clear the timer reference
  }

  /// Private method to handle countdown timer logic
  /// Accepts a completion callback to handle different completion behaviors
  void _startCountdownTimer(VoidCallback onComplete) {
    _stopCountdownTimer();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Stop timer if state changed or became null
      if (state == null ||
          (state!.state != PomodoroState.running &&
              state!.state != PomodoroState.shortBreak &&
              state!.state != PomodoroState.longBreak)) {
        _stopCountdownTimer();
        return;
      }

      // Decrease remaining time by 1 second
      final remainingTime = state!.releaseTime - 1;
      if (remainingTime <= 0) {
        // Time completed, execute completion callback
        _stopCountdownTimer();
        onComplete();
      } else {
        // Update remaining time
        state = state!.copyWith(releaseTime: remainingTime);
      }
    });
  }

  /// Get the default Pomodoro duration from settings or use the app constant
  int get _defaultPomodoroDuration {
    return state?.settings.pomodoroDuration ??
        AppConstants.defaultPomodoroDuration;
  }

  int get _defaultLongBreakPomodoroCount {
    return state?.settings.pomodoroCountBeforeLongBreak ??
        AppConstants.defaultLongBreakPomodoroCount;
  }

  int get _defaultLongBreakDuration {
    return state?.settings.longBreakDuration ??
        AppConstants.defaultLongBreakDuration;
  }

  int get _defaultShortBreakDuration {
    return state?.settings.shortBreakDuration ??
        AppConstants.defaultShortBreakDuration;
  }
}

/// Provider that exposes the HomeStateNotifyProvider to the widget tree
/// Used by UI components to access and modify Pomodoro timer state
final homeStateProvider =
    StateNotifierProvider<HomeStateNotifyProvider, HomeState?>(
      (ref) => HomeStateNotifyProvider(ref.read(settingStateProvider)),
    );
