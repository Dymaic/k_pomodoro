import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:k_pomodoro/features/pomodoro/domain/entities/pomodoro_task.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/providers/pomodoro_task_providers.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/providers/home_providers.dart';

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
            icon: const Icon(Icons.delete_sweep),
            onPressed: () => _showDeleteAllDialog(context),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: const Icon(Icons.add),
      ),
      body: tasksAsyncValue.when(
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
                onPressed: () =>
                    ref.read(pomodoroTaskListProvider.notifier).loadTasks(),
                child: const Text('重试'),
              ),
            ],
          ),
        ),
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
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (_) => ref
              .read(pomodoroTaskListProvider.notifier)
              .toggleTaskCompletion(task),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            color: task.isCompleted ? Colors.grey : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (task.description?.isNotEmpty == true) ...[
              const SizedBox(height: 4),
              Text(task.description!),
            ],
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.timer, size: 16, color: Colors.orange),
                const SizedBox(width: 4),
                Text('${task.pomodoroCount} 个番茄钟'),
                const SizedBox(width: 16),
                Icon(Icons.calendar_today, size: 16, color: Colors.blue),
                const SizedBox(width: 4),
                Text(_formatDate(task.createdAt)),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) => _handleMenuAction(context, value, task),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'select',
              child: Row(
                children: [
                  Icon(Icons.play_arrow),
                  SizedBox(width: 8),
                  Text('选择并开始'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [Icon(Icons.edit), SizedBox(width: 8), Text('编辑')],
              ),
            ),
            const PopupMenuItem(
              value: 'increment',
              child: Row(
                children: [
                  Icon(Icons.add_circle),
                  SizedBox(width: 8),
                  Text('增加番茄钟'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 8),
                  Text('删除', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
        onTap: () => _selectTaskAndGoHome(context, task),
      ),
    );
  }

  void _handleMenuAction(
    BuildContext context,
    String action,
    PomodoroTask task,
  ) {
    switch (action) {
      case 'select':
        _selectTaskAndGoHome(context, task);
        break;
      case 'edit':
        _showEditTaskDialog(context, task);
        break;
      case 'increment':
        ref
            .read(pomodoroTaskListProvider.notifier)
            .incrementPomodoroCount(task);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('已为任务"${task.title}"增加1个番茄钟')));
        break;
      case 'delete':
        _showDeleteTaskDialog(context, task);
        break;
    }
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
    _showTaskDialog(context, '添加任务');
  }

  void _showEditTaskDialog(BuildContext context, PomodoroTask task) {
    ref.read(taskFormProvider.notifier).startEditing(task);
    _showTaskDialog(context, '编辑任务');
  }

  void _showTaskDialog(BuildContext context, String title) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    // 如果是编辑模式，填入现有数据
    final formState = ref.read(taskFormProvider);
    titleController.text = formState.title;
    descriptionController.text = formState.description;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: '任务标题',
                hintText: '请输入任务标题',
              ),
              onChanged: (value) =>
                  ref.read(taskFormProvider.notifier).setTitle(value),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: '任务描述',
                hintText: '请输入任务描述（可选）',
              ),
              maxLines: 3,
              onChanged: (value) =>
                  ref.read(taskFormProvider.notifier).setDescription(value),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          Consumer(
            builder: (context, ref, child) {
              final formState = ref.watch(taskFormProvider);
              final formNotifier = ref.read(taskFormProvider.notifier);

              return ElevatedButton(
                onPressed: formNotifier.isValid
                    ? () => _saveTask(context, formState)
                    : null,
                child: Text(formState.isEditing ? '更新' : '添加'),
              );
            },
          ),
        ],
      ),
    );
  }

  void _saveTask(BuildContext context, TaskFormState formState) async {
    try {
      if (formState.isEditing && formState.editingTask != null) {
        // 编辑现有任务
        final updatedTask = formState.editingTask!.copyWith(
          title: formState.title,
          description: formState.description.isEmpty
              ? null
              : formState.description,
        );
        await ref
            .read(pomodoroTaskListProvider.notifier)
            .updateTask(updatedTask);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('任务更新成功')));
      } else {
        // 创建新任务
        final newTask = PomodoroTask.create(
          title: formState.title,
          description: formState.description.isEmpty
              ? null
              : formState.description,
          createdAt: DateTime.now(),
        );
        await ref.read(pomodoroTaskListProvider.notifier).createTask(newTask);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('任务添加成功')));
      }
      Navigator.of(context).pop();
    } catch (error) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('操作失败: $error')));
    }
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

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
