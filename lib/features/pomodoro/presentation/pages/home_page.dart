import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_pomodoro/core/constants/locale_keys.dart';
import 'package:k_pomodoro/core/utils/date_utils.dart';
import 'package:k_pomodoro/features/pomodoro/enums/pomodoro_enum.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/providers/home_providers.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/providers/home_state.dart';
import 'package:k_skin/k_skin.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeStateProvider);
    final homeStateNotifyProvider = ref.read(homeStateProvider.notifier);

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Icon(Icons.settings, size: 30), SizedBox(width: 20)],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    KDateUtils.formatDurationToMinutesSeconds(
                      Duration(seconds: homeState?.releaseTime ?? 0),
                    ),
                    style: KThemeManager
                        .instance
                        .currentTheme
                        .typography
                        .bodyLarge
                        .copyWith(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'monospace',
                        ),
                  ),
                  SizedBox(height: 20),
                  _buildPomodoroCountIndicator(homeState),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildBtns(homeState, homeStateNotifyProvider),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  /// Build the buttons for the Pomodoro timer
  List<Widget> _buildBtns(
    HomeState? homeState,
    HomeStateNotifyProvider homeStateNotifyProvider,
  ) {
    // Return buttons based on the current state of the Pomodoro timer
    if (homeState == null) {
      return [];
    }
    switch (homeState.state) {
      case PomodoroState.idle:
        return [
          ElevatedButton(
            onPressed: homeStateNotifyProvider.startPomodoro,
            child: Text(LocaleKeys.Home_Start.tr()),
          ),
        ];
      case PomodoroState.running:
        return [
          ElevatedButton(
            onPressed: homeStateNotifyProvider.pausePomodoro,
            child: Text(LocaleKeys.Home_Pause.tr()),
          ),
        ];
      case PomodoroState.runningComplete:
        return [
          ElevatedButton(
            onPressed: homeStateNotifyProvider.startBreak,
            child: Text(LocaleKeys.Home_Break.tr()),
          ),
        ];
      case PomodoroState.pause:
        return [
          ElevatedButton(
            onPressed: homeStateNotifyProvider.resumePomodoro,
            child: Text(LocaleKeys.Home_Resume.tr()),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: homeStateNotifyProvider.resetPomodoro,
            child: Text(LocaleKeys.Home_Reset.tr()),
          ),
        ];
      case PomodoroState.shortBreak:
      case PomodoroState.longBreak:
        return [
          ElevatedButton(
            onPressed: homeStateNotifyProvider.skipBreak,
            child: Text(LocaleKeys.Home_Skip.tr()),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: homeStateNotifyProvider.resetPomodoro,
            child: Text(LocaleKeys.Home_Reset.tr()),
          ),
        ];
      case PomodoroState.breakComplete:
        return [
          ElevatedButton(
            onPressed: homeStateNotifyProvider.startPomodoro,
            child: Text(LocaleKeys.Home_Start.tr()),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: homeStateNotifyProvider.resetPomodoro,
            child: Text(LocaleKeys.Home_Reset.tr()),
          ),
        ];
    }
  }

  /// build pomodoro count indicator
  Widget _buildPomodoroCountIndicator(HomeState? homeState) {
    const int count = 4;
    if (homeState == null) {
      return Container();
    }

    int currentPomodoroIndex = homeState.pomodoroCount;
    bool isRunningOrPause =
        homeState.state == PomodoroState.running ||
        homeState.state == PomodoroState.pause;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        bool isCompleted = index < currentPomodoroIndex;
        bool isCurrent = index == currentPomodoroIndex;

        return Container(
          margin: EdgeInsets.only(right: index < count - 1 ? 10 : 0),
          width: (isCurrent && isRunningOrPause) ? 20 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: isCompleted || (isCurrent && isRunningOrPause)
                ? Colors.black
                : Colors.transparent,
            border: !isCompleted && !(isCurrent && isRunningOrPause)
                ? Border.all(color: Colors.black, width: 1)
                : null,
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }
}
