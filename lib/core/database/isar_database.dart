import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:k_pomodoro/features/pomodoro/domain/entities/pomodoro_task.dart';

class IsarDatabase {
  static Isar? _isar;

  static Future<Isar> getInstance() async {
    if (_isar != null) return _isar!;

    final dir = await getApplicationDocumentsDirectory();

    _isar = await Isar.open([PomodoroTaskSchema], directory: dir.path);

    return _isar!;
  }

  static Future<void> close() async {
    await _isar?.close();
    _isar = null;
  }
}
