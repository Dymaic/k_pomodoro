import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_pomodoro/features/pomodoro/domain/entities/pomodoro_task.dart';
import 'package:k_pomodoro/features/pomodoro/domain/repositories/pomodoro/pomodoro_task_local_repo.dart';
import 'package:k_pomodoro/features/pomodoro/domain/services/pomodoro_service.dart';

// Repository Provider
final pomodoroTaskLocalRepoProvider = Provider<PomodoroTaskLocalRepo>((ref) {
  return PomodoroTaskLocalRepo();
});

// Service Provider
final pomodoroServiceProvider = Provider<PomodoroService>((ref) {
  return PomodoroService(ref.read(pomodoroTaskLocalRepoProvider));
});

// Task List State Notifier
class PomodoroTaskListNotifier
    extends StateNotifier<AsyncValue<List<PomodoroTask>>> {
  final PomodoroService _pomodoroService;

  PomodoroTaskListNotifier(this._pomodoroService)
    : super(const AsyncValue.loading()) {
    loadTasks();
  }

  // 加载所有任务
  Future<void> loadTasks() async {
    try {
      state = const AsyncValue.loading();
      final tasks = await _pomodoroService.getAllTasks();
      state = AsyncValue.data(tasks);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  // 创建任务
  Future<void> createTask(PomodoroTask task) async {
    try {
      await _pomodoroService.createTask(task);
      await loadTasks(); // 重新加载任务列表
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  // 更新任务
  Future<void> updateTask(PomodoroTask task) async {
    try {
      await _pomodoroService.updateTask(task);
      await loadTasks(); // 重新加载任务列表
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  // 删除任务
  Future<void> deleteTask(int id) async {
    try {
      await _pomodoroService.deleteTask(id);
      await loadTasks(); // 重新加载任务列表
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  // 删除所有任务
  Future<void> deleteAllTasks() async {
    try {
      await _pomodoroService.deleteAllTasks();
      await loadTasks(); // 重新加载任务列表
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  // 切换任务完成状态
  Future<void> toggleTaskCompletion(PomodoroTask task) async {
    try {
      final updatedTask = task.copyWith(
        isCompleted: !task.isCompleted,
        completedAt: !task.isCompleted ? DateTime.now() : null,
      );
      await updateTask(updatedTask);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  // 增加任务的番茄钟计数
  Future<void> incrementPomodoroCount(PomodoroTask task) async {
    try {
      final updatedTask = task.copyWith(pomodoroCount: task.pomodoroCount + 1);
      await updateTask(updatedTask);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// Task List Provider
final pomodoroTaskListProvider =
    StateNotifierProvider<
      PomodoroTaskListNotifier,
      AsyncValue<List<PomodoroTask>>
    >((ref) {
      return PomodoroTaskListNotifier(ref.read(pomodoroServiceProvider));
    });

// Selected Task Provider
final selectedTaskProvider = StateProvider<PomodoroTask?>((ref) => null);

// Task Form State Provider (用于添加/编辑任务表单)
class TaskFormState {
  final String title;
  final String description;
  final bool isEditing;
  final PomodoroTask? editingTask;

  TaskFormState({
    this.title = '',
    this.description = '',
    this.isEditing = false,
    this.editingTask,
  });

  TaskFormState copyWith({
    String? title,
    String? description,
    bool? isEditing,
    PomodoroTask? editingTask,
  }) {
    return TaskFormState(
      title: title ?? this.title,
      description: description ?? this.description,
      isEditing: isEditing ?? this.isEditing,
      editingTask: editingTask ?? this.editingTask,
    );
  }
}

class TaskFormNotifier extends StateNotifier<TaskFormState> {
  TaskFormNotifier() : super(TaskFormState());

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setDescription(String description) {
    state = state.copyWith(description: description);
  }

  void startEditing(PomodoroTask task) {
    state = TaskFormState(
      title: task.title,
      description: task.description ?? '',
      isEditing: true,
      editingTask: task,
    );
  }

  void reset() {
    state = TaskFormState();
  }

  bool get isValid => state.title.trim().isNotEmpty;
}

final taskFormProvider = StateNotifierProvider<TaskFormNotifier, TaskFormState>(
  (ref) {
    return TaskFormNotifier();
  },
);
