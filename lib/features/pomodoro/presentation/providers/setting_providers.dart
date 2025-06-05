import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_pomodoro/features/pomodoro/domain/entities/settings.dart';
import 'package:k_pomodoro/features/pomodoro/domain/repositories/setting/setting_local_repo.dart';
import 'package:k_pomodoro/features/pomodoro/domain/services/settings_service.dart';

final settingLocalRepoProvider = Provider<SettingLocalRepo>((ref) {
  return SettingLocalRepo.getInstance();
});

final settingsServiceProvider = Provider<SettingsService>((ref) {
  return SettingsService.getInstance();
});

final settingStateProvider =
    StateNotifierProvider<SettingStateNotifier, Settings>((ref) {
      return SettingStateNotifier(ref.read(settingsServiceProvider));
    });

class SettingStateNotifier extends StateNotifier<Settings> {
  final SettingsService _settingsService;

  SettingStateNotifier(this._settingsService)
    : super(Settings.defaultSettings()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final settings = await _settingsService.getCurrentSettings();
    state = settings;
  }

  Future<void> updateSettings(Settings settings) async {
    await _settingsService.updateSettings(settings);
    state = settings;
  }

  Future<void> resetToDefault() async {
    await _settingsService.resetSettings();
    state = Settings.defaultSettings();
  }
}
