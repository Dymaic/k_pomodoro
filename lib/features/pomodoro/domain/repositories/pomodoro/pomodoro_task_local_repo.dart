import 'package:isar/isar.dart';
import 'package:k_pomodoro/features/pomodoro/domain/entities/pomodoro_task.dart';

class PomodoroTaskLocalRepo {
  final Isar _isar;

  PomodoroTaskLocalRepo() : _isar = Isar.getInstance() ?? (throw Exception('Isar instance not initialized'));

  // 创建任务
  Future<int> createTask(PomodoroTask task) async {
    return await _isar.writeTxn(() async {
      return await _isar.pomodoroTasks.put(task);
    });
  }

  // 获取所有任务
  Future<List<PomodoroTask>> getAllTasks() async {
    return await _isar.pomodoroTasks.where().findAll();
  }

  // 根据ID获取任务
  Future<PomodoroTask?> getTaskById(int id) async {
    return await _isar.pomodoroTasks.get(id);
  }

  // 更新任务
  Future<int> updateTask(PomodoroTask task) async {
    return await _isar.writeTxn(() async {
      return await _isar.pomodoroTasks.put(task);
    });
  }

  // 删除任务
  Future<bool> deleteTask(int id) async {
    return await _isar.writeTxn(() async {
      return await _isar.pomodoroTasks.delete(id);
    });
  }

  // 删除所有任务
  Future<int> deleteAllTasks() async {
    return await _isar.writeTxn(() async {
      return await _isar.pomodoroTasks.where().deleteAll();
    });
  }

  // 监听任务变化
  Stream<List<PomodoroTask>> watchAllTasks() {
    return _isar.pomodoroTasks.where().watch(fireImmediately: true);
  }
}