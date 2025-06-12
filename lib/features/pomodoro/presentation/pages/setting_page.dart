import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:k_pomodoro/core/constants/locale_keys.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/providers/setting_providers.dart';
import 'package:k_skin/k_skin.dart';

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

  // 本地状态，用于临时保存Switch的值
  bool? _tempAutoStartBreak;
  bool? _tempAutoStartPomodoro;

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

    // 初始化临时状态（如果还未设置）
    _tempAutoStartBreak ??= settingState.isAutoStartBreak;
    _tempAutoStartPomodoro ??= settingState.isAutoStartPomodoro;

    _pomodoroController.text = settingState.pomodoroDuration.toString();
    _shortBreakController.text = settingState.shortBreakDuration.toString();
    _longBreakController.text = settingState.longBreakDuration.toString();
    _longBreakIntervalController.text = settingState
        .pomodoroCountBeforeLongBreak
        .toString();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          // 重置按钮
          IconButton(
            onPressed: () {
              setState(() {
                // 重置所有临时状态到原始值
                final settingState = ref.read(settingStateProvider);
                _pomodoroController.text = settingState.pomodoroDuration
                    .toString();
                _shortBreakController.text = settingState.shortBreakDuration
                    .toString();
                _longBreakController.text = settingState.longBreakDuration
                    .toString();
                _longBreakIntervalController.text = settingState
                    .pomodoroCountBeforeLongBreak
                    .toString();
                _tempAutoStartBreak = settingState.isAutoStartBreak;
                _tempAutoStartPomodoro = settingState.isAutoStartPomodoro;
              });

              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('已重置为原始设置')));
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
          // 保存按钮
          IconButton(
            onPressed: () {
              // 保存所有设置到数据库
              settingStateNotifier.updateSettings(
                settingState.copyWith(
                  pomodoroDuration: int.parse(_pomodoroController.text),
                  shortBreakDuration: int.parse(_shortBreakController.text),
                  longBreakDuration: int.parse(_longBreakController.text),
                  pomodoroCountBeforeLongBreak: int.parse(
                    _longBreakIntervalController.text,
                  ),
                  isAutoStartBreak: _tempAutoStartBreak!,
                  isAutoStartPomodoro: _tempAutoStartPomodoro!,
                ),
              );

              // 显示保存成功的提示
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('设置已保存')));
            },
            icon: const Icon(Icons.save_rounded),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _buildSettingRow(
              LocaleKeys.Setting_PomodoroDuration,
              _buildCountInput(numController: _pomodoroController),
            ),
            Divider(height: 1, thickness: 1, color: Colors.grey[300]),
            _buildSettingRow(
              LocaleKeys.Setting_ShortBreakDuration,
              _buildCountInput(numController: _shortBreakController),
            ),
            Divider(height: 1, thickness: 1, color: Colors.grey[300]),
            _buildSettingRow(
              LocaleKeys.Setting_LongBreakDuration,
              _buildCountInput(numController: _longBreakController),
            ),
            Divider(height: 1, thickness: 1, color: Colors.grey[300]),
            _buildSettingRow(
              LocaleKeys.Setting_LongBreakInterval,
              _buildCountInput(numController: _longBreakIntervalController),
            ),
            SizedBox(height: 10),
            _buildSettingRow(
              LocaleKeys.Setting_AutoBreak,
              Switch(
                value: _tempAutoStartBreak!,
                onChanged: (value) {
                  setState(() {
                    _tempAutoStartBreak = value;
                  });
                },
              ),
            ),
            Divider(height: 1, thickness: 1, color: Colors.grey[300]),
            _buildSettingRow(
              LocaleKeys.Setting_AutoStart,
              Switch(
                value: _tempAutoStartPomodoro!,
                onChanged: (value) {
                  setState(() {
                    _tempAutoStartPomodoro = value;
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () => context.push('/about'),
              child: _buildSettingRow(
                "About",
                Icon(Icons.keyboard_arrow_right),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingRow(String label, Widget widget) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: KThemeManager.instance.currentTheme.colorScheme.surface,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label, style: const TextStyle(fontSize: 14))),
          widget,
        ],
      ),
    );
  }

  Widget _buildCountInput({required TextEditingController numController}) {
    return SizedBox(
      width: 130,
      child: Row(
        children: [
          IconButton(
            iconSize: 18,
            onPressed: numController.text == '1'
                ? null
                : () {
                    int currentValue = int.parse(numController.text);
                    if (currentValue > 1) {
                      numController.text = (currentValue - 1).toString();
                    }
                  },
            icon: Icon(
              Icons.remove,
              color: numController.text == '1' ? Colors.grey : null,
            ),
          ),
          Expanded(
            child: TextField(
              controller: numController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
              decoration: const InputDecoration(border: InputBorder.none),
              onChanged: (value) {
                int? intValue = int.tryParse(value);
                if (intValue != null && intValue < 1) {
                  numController.text = '1';
                }
              },
            ),
          ),
          IconButton(
            iconSize: 18,
            onPressed: () {
              int currentValue = int.parse(numController.text);
              numController.text = (currentValue + 1).toString();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
