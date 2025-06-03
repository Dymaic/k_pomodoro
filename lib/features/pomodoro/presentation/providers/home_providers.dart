import 'dart:async';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_pomodoro/features/pomodoro/domain/entities/pomodoro_task.dart';
import 'package:k_pomodoro/features/pomodoro/enums/pomodoro_enum.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/providers/home_state.dart';

/// StateNotifier that manages the Pomodoro timer state and functionality
/// Handles timer operations, state transitions, and break management
class HomeStateNotifyProvider extends StateNotifier<HomeState?> {
  static const _defaultPomodoroDuration =
      25; // Default work session duration in seconds

  static const _defaultShortBreakDuration =
      5; // Default short break duration in seconds
  static const _defaultLongBreakDuration =
      15; // Default long break duration in seconds

  static const _defaultLongBreakPomodoroCount =
      4; // Default number of completed pomodoros

  /// Initialize with default Pomodoro settings
  /// Default work session: 25 minutes, idle state
  HomeStateNotifyProvider() : super(null) {
    state = HomeState(
      currentTask: PomodoroTask.empty(), // No task selected initially
      releaseTime:
          _defaultPomodoroDuration, // 25 minutes in seconds for work session
      breakTime: 0, // Short break duration (to be set later)
      longBreakTime: 0, // Long break duration (to be set later)
      pomodoroCount: 0, // Number of completed pomodoros
      state: PomodoroState.idle, // Initial state is idle
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
      _timer?.cancel();
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
      });
    }
  }

  /// Reset the Pomodoro timer to initial state
  /// Cancels any active timer and resets all values to default
  void resetPomodoro() {
    if (state != null) {
      // Cancel any active timer
      _timer?.cancel();
      // Reset to initial state with default values
      state = HomeState(
        currentTask: PomodoroTask.empty(),
        releaseTime: _defaultPomodoroDuration, // Reset to 25 minutes
        breakTime: 0,
        longBreakTime: 0,
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
      state = state!.copyWith(
        state: PomodoroState.breakComplete,
        releaseTime: _defaultPomodoroDuration, // Reset to default pomodoro time
      );
    });
  }

  /// Skip the current break and return to running state
  void skipBreak() {
    if (state != null &&
        (state!.state == PomodoroState.shortBreak ||
            state!.state == PomodoroState.longBreak)) {
      _timer?.cancel();
      // Skip the break and return to idle state
      state = state!.copyWith(
        state: PomodoroState.running,
        releaseTime: _defaultPomodoroDuration, // Reset to default pomodoro time
      );
      startPomodoro();
    }
  }

  /// Private method to handle countdown timer logic
  /// Accepts a completion callback to handle different completion behaviors
  void _startCountdownTimer(VoidCallback onComplete) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _timer = timer;

      // Stop timer if state changed or became null
      if (state == null ||
          (state!.state != PomodoroState.running &&
              state!.state != PomodoroState.shortBreak &&
              state!.state != PomodoroState.longBreak)) {
        _timer?.cancel();
        return;
      }

      // Decrease remaining time by 1 second
      final remainingTime = state!.releaseTime - 1;
      if (remainingTime <= 0) {
        // Time completed, execute completion callback
        onComplete();
        _timer?.cancel();
      } else {
        // Update remaining time
        state = state!.copyWith(releaseTime: remainingTime);
      }
    });
  }
}

/// Provider that exposes the HomeStateNotifyProvider to the widget tree
/// Used by UI components to access and modify Pomodoro timer state
final homeStateProvider =
    StateNotifierProvider<HomeStateNotifyProvider, HomeState?>(
      (ref) => HomeStateNotifyProvider(),
    );
