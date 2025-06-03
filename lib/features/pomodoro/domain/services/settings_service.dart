import 'package:k_pomodoro/features/pomodoro/domain/entities/settings.dart';
import 'package:k_pomodoro/features/pomodoro/domain/repositories/setting/setting_local_repo.dart';

class SettingsService {

  final SettingLocalRepo settingsLocalRepo;

  SettingsService({required this.settingsLocalRepo});
  
  /// 获取当前设置
  Future<Settings> getCurrentSettings() async {
    return Settings(
      theme: 'light', // 默认主题
      locale: 'en_US', // 默认语言
      notificationsEnabled: true, // 默认启用通知
      pomodoroDuration: settingsLocalRepo.getPomodoroMinutes(), // 番茄钟时长
      shortBreakDuration: settingsLocalRepo.getShortBreakMinutes(), // 短休息时长
      longBreakDuration: settingsLocalRepo.getLongBreakMinutes(), // 长休息时长
      pomodoroCountBeforeLongBreak: settingsLocalRepo.getLongBreakInterval(), // 长休息间隔
      isAutoStartPomodoro: settingsLocalRepo.getAutoStartNext(), // 自动开始下一个番茄钟
      isAutoStartBreak: settingsLocalRepo.getAutoStartBreak(), // 自动开始休息
    );
  }

  /// 更新设置
  Future<void> updateSettings(Settings settings) async {
    await settingsLocalRepo.setPomodoroMinutes(settings.pomodoroDuration);
    await settingsLocalRepo.setShortBreakMinutes(settings.shortBreakDuration);
    await settingsLocalRepo.setLongBreakMinutes(settings.longBreakDuration);
    await settingsLocalRepo.setLongBreakInterval(settings.pomodoroCountBeforeLongBreak);
    await settingsLocalRepo.setAutoStartNext(settings.isAutoStartPomodoro);
    await settingsLocalRepo.setAutoStartBreak(settings.isAutoStartBreak);
  }

  /// 重置设置为默认值
  Future<void> resetSettings() async {
    final defaultSettings = Settings.defaultSettings();
    await settingsLocalRepo.setPomodoroMinutes(defaultSettings.pomodoroDuration);
    await settingsLocalRepo.setShortBreakMinutes(defaultSettings.shortBreakDuration);
    await settingsLocalRepo.setLongBreakMinutes(defaultSettings.longBreakDuration);
    await settingsLocalRepo.setLongBreakInterval(defaultSettings.pomodoroCountBeforeLongBreak);
    await settingsLocalRepo.setAutoStartNext(defaultSettings.isAutoStartPomodoro);
    await settingsLocalRepo.setAutoStartBreak(defaultSettings.isAutoStartBreak);
  }

  /// 检查设置是否已初始化
  Future<bool> isSettingsInitialized() async {
    // 检查是否存在设置数据
    return settingsLocalRepo.getPomodoroMinutes() != null &&
           settingsLocalRepo.getShortBreakMinutes() != null &&
           settingsLocalRepo.getLongBreakMinutes() != null &&
           settingsLocalRepo.getLongBreakInterval() != null &&
           settingsLocalRepo.getAutoStartNext() != null &&
           settingsLocalRepo.getAutoStartBreak() != null;
  }

  /// 初始化设置
  Future<void> initializeSettings() async {
    if (!await isSettingsInitialized()) {
      final defaultSettings = Settings.defaultSettings();
      await updateSettings(defaultSettings);
    }
  }

  Future<void> setPomodoroDuration(int duration) async {
    await settingsLocalRepo.setPomodoroMinutes(duration);
  }

  Future<int> getPomodoroDuration() async {
    return settingsLocalRepo.getPomodoroMinutes();
  }

  Future<void> setShortBreakDuration(int duration) async {
    await settingsLocalRepo.setShortBreakMinutes(duration);
  }

  Future<int> getShortBreakDuration() async {
    return settingsLocalRepo.getShortBreakMinutes();
  }

  Future<void> setLongBreakDuration(int duration) async {
    await settingsLocalRepo.setLongBreakMinutes(duration);
  }

  Future<int> getLongBreakDuration() async {
    return settingsLocalRepo.getLongBreakMinutes();
  }

  Future<void> setPomodoroCountBeforeLongBreak(int count) async {
    await settingsLocalRepo.setLongBreakInterval(count);
  }

  Future<int> getPomodoroCountBeforeLongBreak() async {
    return settingsLocalRepo.getLongBreakInterval();
  }

  Future<void> setAutoStartPomodoro(bool autoStart) async {
    await settingsLocalRepo.setAutoStartNext(autoStart);
  }

  Future<bool> getAutoStartPomodoro() async {
    return settingsLocalRepo.getAutoStartNext();
  }

  Future<void> setAutoStartBreak(bool autoStart) async {
    await settingsLocalRepo.setAutoStartBreak(autoStart);
  }

  Future<bool> getAutoStartBreak() async {
    return settingsLocalRepo.getAutoStartBreak();
  }

}