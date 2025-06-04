import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:k_pomodoro/core/constants/locale_keys.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/providers/setting_providers.dart';

/// Setting Page
class SettingPage extends ConsumerStatefulWidget {
  const SettingPage({super.key});

  @override
  ConsumerState<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends ConsumerState<SettingPage> {
  late final TextEditingController _pomodoroController;
  late final TextEditingController _shortBreakController;
  late final TextEditingController _longBreakController;
  late final TextEditingController _longBreakIntervalController;

  @override
  void initState() {
    super.initState();
    _pomodoroController = TextEditingController();
    _shortBreakController = TextEditingController();
    _longBreakController = TextEditingController();
    _longBreakIntervalController = TextEditingController();
  }

  @override
  void dispose() {
    _pomodoroController.dispose();
    _shortBreakController.dispose();
    _longBreakController.dispose();
    _longBreakIntervalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settingState = ref.watch(settingStateProvider);
    final settingStateNotifier = ref.read(settingStateProvider.notifier);

    _pomodoroController.text = settingState.pomodoroDuration.toString();
    _shortBreakController.text = settingState.shortBreakDuration.toString();
    _longBreakController.text = settingState.longBreakDuration.toString();
    _longBreakIntervalController.text = settingState
        .pomodoroCountBeforeLongBreak
        .toString();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              settingStateNotifier.updateSettings(
                settingState.copyWith(
                  pomodoroDuration: int.parse(_pomodoroController.text),
                  shortBreakDuration: int.parse(_shortBreakController.text),
                  longBreakDuration: int.parse(_longBreakController.text),
                  pomodoroCountBeforeLongBreak: int.parse(
                    _longBreakIntervalController.text,
                  ),
                ),
              );
            },
            child: const Text('保存'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildSettingRow(
              LocaleKeys.Setting_PomodoroDuration,
              TextField(
                decoration: InputDecoration(
                  hintText: settingState.pomodoroDuration.toString(),
                  suffix: Text('分钟'),
                ),
                controller: _pomodoroController,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingRow(
              LocaleKeys.Setting_ShortBreakDuration,
              TextField(
                decoration: InputDecoration(
                  hintText: settingState.shortBreakDuration.toString(),
                  suffix: Text('分钟'),
                ),
                controller: _shortBreakController,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingRow(
              LocaleKeys.Setting_LongBreakDuration,
              TextField(
                decoration: InputDecoration(
                  hintText: settingState.longBreakDuration.toString(),
                  suffix: Text('分钟'),
                ),
                controller: _longBreakController,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingRow(
              LocaleKeys.Setting_LongBreakInterval,
              TextField(
                decoration: InputDecoration(
                  hintText: settingState.pomodoroCountBeforeLongBreak
                      .toString(),
                ),
                controller: _longBreakIntervalController,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingRow(
              LocaleKeys.Setting_AutoBreak,
              Switch(
                value: settingState.isAutoStartBreak,
                onChanged: (value) {
                  settingStateNotifier.updateSettings(
                    settingState.copyWith(isAutoStartBreak: value),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingRow(
              LocaleKeys.Setting_AutoStart,
              Switch(
                value: settingState.isAutoStartPomodoro,
                onChanged: (value) {
                  settingStateNotifier.updateSettings(
                    settingState.copyWith(isAutoStartPomodoro: value),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingRow(String label, Widget widget) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        SizedBox(width: 150, child: widget),
      ],
    );
  }
}
