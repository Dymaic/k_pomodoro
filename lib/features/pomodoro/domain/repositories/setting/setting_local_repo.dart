import 'package:hive/hive.dart';
import 'package:k_pomodoro/core/constants/app_constants.dart';
import 'package:path_provider/path_provider.dart';

/// 本地设置仓库
/// 用于存储和管理番茄钟相关的设置
class SettingLocalRepo {
  late Box<dynamic> _settingsBox;
  static SettingLocalRepo? _instance;
  static bool _isInitialized = false;

  SettingLocalRepo._();

  /// 获取单例实例
  static SettingLocalRepo getInstance() {
    _instance ??= SettingLocalRepo._();
    return _instance!;
  }

  Future<void> init() async {
    // 防止重复初始化，避免锁文件冲突
    if (_isInitialized) {
      return;
    }

    try {
      // Initialize Hive with app documents directory
      final directory = await getApplicationDocumentsDirectory();
      
      // 检查 Hive 是否已经初始化过，通过捕获异常来判断
      try {
        Hive.init(directory.path);
      } catch (e) {
        // Hive 已经初始化过，忽略错误
      }

      _settingsBox = await Hive.openBox('setting');
      _isInitialized = true;
    } catch (e) {
      // 如果出现锁文件冲突，尝试关闭并重新打开
      try {
        await Hive.close();
        final directory = await getApplicationDocumentsDirectory();
        Hive.init(directory.path);
        _settingsBox = await Hive.openBox('setting');
        _isInitialized = true;
      } catch (retryError) {
        throw Exception('Failed to initialize Hive settings: $retryError');
      }
    }
  }

  /// 释放资源
  Future<void> dispose() async {
    if (_isInitialized) {
      await _settingsBox.close();
      _isInitialized = false;
    }
  }

  // 番茄钟时长设置
  Future<void> setPomodoroMinutes(int minutes) async {
    await _settingsBox.put('pomodoro_minutes', minutes);
  }

  int getPomodoroMinutes() {
    return _settingsBox.get(
      'pomodoro_minutes',
      defaultValue: AppConstants.defaultPomodoroDuration,
    );
  }

  // 短休息时长设置
  Future<void> setShortBreakMinutes(int minutes) async {
    await _settingsBox.put('short_break_minutes', minutes);
  }

  int getShortBreakMinutes() {
    return _settingsBox.get(
      'short_break_minutes',
      defaultValue: AppConstants.defaultShortBreakDuration,
    );
  }

  // 长休息时长设置
  Future<void> setLongBreakMinutes(int minutes) async {
    await _settingsBox.put('long_break_minutes', minutes);
  }

  int getLongBreakMinutes() {
    return _settingsBox.get(
      'long_break_minutes',
      defaultValue: AppConstants.defaultLongBreakDuration,
    );
  }

  // 长休息间隔设置
  Future<void> setLongBreakInterval(int interval) async {
    await _settingsBox.put('long_break_interval', interval);
  }

  int getLongBreakInterval() {
    return _settingsBox.get(
      'long_break_interval',
      defaultValue: AppConstants.defaultLongBreakPomodoroCount,
    );
  }

  // 自动开始下一个番茄钟
  Future<void> setAutoStartNext(bool autoStart) async {
    await _settingsBox.put('auto_start_next', autoStart);
  }

  bool getAutoStartNext() {
    return _settingsBox.get('auto_start_next', defaultValue: false);
  }

  // 自动开始休息
  Future<void> setAutoStartBreak(bool autoStart) async {
    await _settingsBox.put('auto_start_break', autoStart);
  }

  bool getAutoStartBreak() {
    return _settingsBox.get('auto_start_break', defaultValue: false);
  }

  // 声音提醒设置
  Future<void> setSoundNotification(bool enabled) async {
    await _settingsBox.put('sound_notification', enabled);
  }

  bool getSoundNotification() {
    return _settingsBox.get('sound_notification', defaultValue: true);
  }

  // 震动提醒设置
  Future<void> setVibrationNotification(bool enabled) async {
    await _settingsBox.put('vibration_notification', enabled);
  }

  bool getVibrationNotification() {
    return _settingsBox.get('vibration_notification', defaultValue: true);
  }

  // 通用方法
  Future<void> saveSetting(String key, dynamic value) async {
    await _settingsBox.put(key, value);
  }

  T? getSetting<T>(String key, [T? defaultValue]) {
    return _settingsBox.get(key, defaultValue: defaultValue) as T?;
  }

  Future<void> deleteSetting(String key) async {
    await _settingsBox.delete(key);
  }

  Future<void> clearAllSettings() async {
    await _settingsBox.clear();
  }

  bool containsSetting(String key) {
    return _settingsBox.containsKey(key);
  }

  List<String> getAllKeys() {
    return _settingsBox.keys.cast<String>().toList();
  }
}
