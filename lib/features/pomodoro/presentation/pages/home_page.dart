import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:k_pomodoro/core/constants/locale_keys.dart';
import 'package:k_pomodoro/core/utils/date_utils.dart';
import 'package:k_pomodoro/features/pomodoro/enums/pomodoro_enum.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/providers/home_providers.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/providers/home_state.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/providers/setting_providers.dart';
import 'package:k_skin/k_skin.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _taskInputController = TextEditingController();

  @override
  void dispose() {
    _taskInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeStateProvider);
    final homeStateNotifyProvider = ref.read(homeStateProvider.notifier);

    ref.listen(settingStateProvider, (previous, next) {
      // Listen for changes in settings and update the home state accordingly
      if (homeState != null) {
        homeStateNotifyProvider.updateSettings(next);
      }
    });

    // 监听homeState变化，当开始番茄钟时清空输入框
    ref.listen(homeStateProvider, (previous, next) {
      if (previous?.state != PomodoroState.running &&
          next?.state == PomodoroState.running &&
          next?.currentTask != null) {
        _taskInputController.clear();
      }
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.list),
          onPressed: () => context.push('/tasks'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 80), // 为悬浮任务卡片留出空间
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
                      _buildPomodoroCountIndicator(ref, homeState),
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
          // 悬浮在顶部的任务卡片
          Positioned(
            top: 0,
            left: 16,
            right: 16,
            child: _buildCurrentTaskWidget(context, ref, homeState),
          ),
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
            onPressed: () => homeStateNotifyProvider.startPomodoro(
              _taskInputController.text.trim(),
            ),
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
            onPressed: () => homeStateNotifyProvider.startPomodoro(
              _taskInputController.text.trim(),
            ),
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
  Widget _buildPomodoroCountIndicator(WidgetRef ref, HomeState? homeState) {
    if (homeState == null) {
      return Container();
    }

    final settingState = ref.watch(settingStateProvider);
    final int count = settingState.pomodoroCountBeforeLongBreak;

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

  /// 当前任务显示组件
  Widget _buildCurrentTaskWidget(
    BuildContext context,
    WidgetRef ref,
    HomeState? homeState,
  ) {
    if (homeState?.currentTask == null) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              if (homeState?.state != PomodoroState.running &&
                  homeState?.state != PomodoroState.pause)
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _taskInputController,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: '输入任务名称',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                          filled: false,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 16,
                        icon: const Icon(Icons.change_circle_outlined),
            onPressed: () => context.go('/tasks'),
                      ),
                    ),
                  ],
                ),
              if (homeState?.state == PomodoroState.running ||
                  homeState?.state == PomodoroState.pause) ...[
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: LinearProgressIndicator(
                      value: () {
                        final settingState = ref.watch(settingStateProvider);
                        final totalTime = settingState.pomodoroDuration;
                        return totalTime > 0
                            ? (totalTime - homeState!.releaseTime) / totalTime
                            : 0.0;
                      }(),
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        KThemeManager.instance.currentTheme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    final task = homeState!.currentTask!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (homeState.state != PomodoroState.running &&
                    homeState.state != PomodoroState.pause)
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 16,
                      onPressed: () {},
                      icon: Icon(
                        task.isCompleted
                            ? Icons.check_circle_outline
                            : Icons.circle_outlined,
                      ),
                    ),
                  ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    task.title,
                    style: KThemeManager
                        .instance
                        .currentTheme
                        .typography
                        .bodySmall,
                  ),
                ),
                SizedBox(width: 8),
                if (homeState.state != PomodoroState.running &&
                    homeState.state != PomodoroState.pause)
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 16,
                      icon: const Icon(Icons.change_circle_outlined),
                      onPressed: () => context.go('/tasks'),
                    ),
                  ),
                if (homeState.state != PomodoroState.running &&
                    homeState.state != PomodoroState.pause)
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 16,
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        final homeStateNotifier = ref.read(
                          homeStateProvider.notifier,
                        );
                        homeStateNotifier.clearCurrentTask();
                      },
                    ),
                  ),
              ],
            ),
            if (homeState.state == PomodoroState.running ||
                homeState.state == PomodoroState.pause) ...[
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: LinearProgressIndicator(
                    value: () {
                      final settingState = ref.watch(settingStateProvider);
                      final totalTime = settingState.pomodoroDuration; // 转换为秒
                      return totalTime > 0
                          ? (totalTime - homeState.releaseTime) / totalTime
                          : 0.0;
                    }(),
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      KThemeManager.instance.currentTheme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      )
    );
  }
}
