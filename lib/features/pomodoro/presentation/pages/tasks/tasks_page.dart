import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:k_pomodoro/core/utils/date_utils.dart';
import 'package:k_pomodoro/features/pomodoro/domain/entities/pomodoro_task.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/pages/tasks/widgets/task_create_dialog.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/providers/pomodoro_task_providers.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/providers/home_providers.dart';
import 'package:k_skin/k_skin.dart';

class TasksPage extends ConsumerStatefulWidget {
  const TasksPage({super.key});

  @override
  ConsumerState<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends ConsumerState<TasksPage> {
  @override
  Widget build(BuildContext context) {
    final tasksAsyncValue = ref.watch(pomodoroTaskListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('任务管理'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded),
            onPressed: () => _showDeleteAllDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: tasksAsyncValue.when(
              data: (tasks) => _buildTasksList(context, tasks),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('加载失败: $error'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => ref
                          .read(pomodoroTaskListProvider.notifier)
                          .loadTasks(),
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                _showAddTaskDialog(context);
              },
              child: Text('添加新任务'),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTasksList(BuildContext context, List<PomodoroTask> tasks) {
    if (tasks.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.task_alt, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('暂无任务', style: TextStyle(fontSize: 18, color: Colors.grey)),
            SizedBox(height: 8),
            Text('点击右下角按钮添加新任务', style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return _buildTaskCard(context, task);
      },
    );
  }

  Widget _buildTaskCard(BuildContext context, PomodoroTask task) {
    return GestureDetector(
      onTap: () => _showEditTaskDialog(context, task),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: KThemeManager.instance.currentTheme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 32,
                  height: 32,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 20,
                    onPressed: () {
                      ref
                          .read(pomodoroTaskListProvider.notifier)
                          .toggleTaskCompletion(task);
                    },
                    icon: Icon(
                      task.isCompleted
                          ? Icons.check_circle_outline
                          : Icons.circle_outlined,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      task.title,
                      style: KThemeManager
                          .instance
                          .currentTheme
                          .typography
                          .bodyMedium,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 32,
                  height: 32,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 20,
                    onPressed: () {
                      _selectTaskAndGoHome(context, task);
                    },
                    icon: Icon(Icons.play_arrow_outlined),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 8),
                    Icon(Icons.timer, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      '${task.pomodoroCount}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Text(
                  KDateUtils.formatDate(task.createdAt),
                  style: KThemeManager
                      .instance
                      .currentTheme
                      .typography
                      .bodySmall
                      .copyWith(color: Colors.grey.shade500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _selectTaskAndGoHome(BuildContext context, PomodoroTask task) {
    // 设置当前任务到番茄钟状态
    ref.read(homeStateProvider.notifier).setCurrentTask(task);
    ref.read(selectedTaskProvider.notifier).state = task;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('已选择任务: ${task.title}')));

    context.go('/');
  }

  void _showAddTaskDialog(BuildContext context) {
    ref.read(taskFormProvider.notifier).reset();
    _showTaskBottomSheet(context, null);
  }

  void _showEditTaskDialog(BuildContext context, PomodoroTask task) {
    ref.read(taskFormProvider.notifier).startEditing(task);
    _showTaskBottomSheet(context, task);
  }

  void _showTaskBottomSheet(BuildContext context, PomodoroTask? task) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.9,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => TaskCreateDialog(task: task),
      ),
    );
  }

  void _showDeleteTaskDialog(BuildContext context, PomodoroTask task) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: Text('确定要删除任务"${task.title}"吗？此操作不可撤销。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              ref.read(pomodoroTaskListProvider.notifier).deleteTask(task.id);
              Navigator.of(context).pop();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('已删除任务: ${task.title}')));
            },
            child: const Text('删除', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showDeleteAllDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: const Text('确定要删除所有任务吗？此操作不可撤销。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              ref.read(pomodoroTaskListProvider.notifier).deleteAllTasks();
              Navigator.of(context).pop();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('已删除所有任务')));
            },
            child: const Text('删除全部', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
