import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_pomodoro/core/constants/locale_keys.dart';
import 'package:k_pomodoro/core/utils/date_utils.dart';
import 'package:k_pomodoro/features/pomodoro/domain/entities/pomodoro_task.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/providers/pomodoro_task_providers.dart';
import 'package:k_skin/k_skin.dart';

class TaskCreateDialog extends ConsumerStatefulWidget {
  final PomodoroTask? task; // 可选的task参数，为null时是创建，有值时是编辑

  const TaskCreateDialog({super.key, this.task});

  @override
  ConsumerState<TaskCreateDialog> createState() => _TaskCreateDialogState();
}

class _TaskCreateDialogState extends ConsumerState<TaskCreateDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _pomodoroCountController =
      TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _dueTimeController = TextEditingController();

  bool get isEditing => widget.task != null;

  @override
  void initState() {
    super.initState();
    // 如果是编辑模式，初始化控制器的值
    if (isEditing) {
      _titleController.text = widget.task!.title;
      _pomodoroCountController.text = widget.task!.pomodoroCount.toString();
      if (widget.task!.startTime != null) {
        _startTimeController.text = KDateUtils.formatDate(
          widget.task!.startTime!,
        );
      }
      if (widget.task!.dueTime != null) {
        _dueTimeController.text = KDateUtils.formatDate(widget.task!.dueTime!);
      }
    } else {
      // 创建模式时设置默认值
      _pomodoroCountController.text = '1';
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _pomodoroCountController.dispose();
    _startTimeController.dispose();
    _dueTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 标题显示创建或编辑
          Text(
            isEditing
                ? LocaleKeys.Task_Update.tr()
                : LocaleKeys.Task_Create.tr(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),

          // 可滚动的表单内容
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // 第一行：标题输入框
                  SizedBox(
                    height: 150,
                    child: TextField(
                      controller: _titleController,
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.Task_Title.tr(),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: const OutlineInputBorder(),
                        filled: true,
                        alignLabelWithHint: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),

                  // 第二行：数量
                  Container(
                    color:
                        KThemeManager.instance.currentTheme.colorScheme.surface,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(LocaleKeys.Task_PomodoroCount.tr()),
                        _buildQuantitySelector(),
                      ],
                    ),
                  ),
                  // 分割线
                  Divider(height: 1, thickness: 1, color: Colors.grey[300]),
                  // 第三行：开始时间
                  Container(
                    color:
                        KThemeManager.instance.currentTheme.colorScheme.surface,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(LocaleKeys.Task_StartDate.tr()),
                        Row(
                          children: [
                            Text(_startTimeController.text),
                            if (_startTimeController.text.isNotEmpty)
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _startTimeController.clear();
                                  });
                                },
                                icon: const Icon(Icons.close, size: 20),
                              )
                            else
                              IconButton(
                                onPressed: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      _startTimeController.text =
                                          KDateUtils.formatDate(picked);
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.calendar_today,
                                  size: 20,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // 分割线
                  Divider(height: 1, thickness: 1, color: Colors.grey[300]),
                  // 第四行：结束时间
                  Container(
                    color:
                        KThemeManager.instance.currentTheme.colorScheme.surface,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(LocaleKeys.Task_DueDate.tr()),
                        Row(
                          children: [
                            Text(_dueTimeController.text),
                            if (_dueTimeController.text.isNotEmpty)
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _dueTimeController.clear();
                                  });
                                },
                                icon: const Icon(Icons.close, size: 20),
                              )
                            else
                              IconButton(
                                onPressed: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      _dueTimeController.text =
                                          KDateUtils.formatDate(picked);
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.calendar_today,
                                  size: 20,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          // 确认和取消按钮
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // 取消操作
                  },
                  child: Text(LocaleKeys.Common_Cancel.tr()),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FilledButton(
                  onPressed: () => _saveTask(context),
                  child: Text(
                    isEditing
                        ? LocaleKeys.Task_Update.tr()
                        : LocaleKeys.Task_Create.tr(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            int currentValue = int.tryParse(_pomodoroCountController.text) ?? 1;
            if (currentValue > 1) {
              setState(() {
                _pomodoroCountController.text = (currentValue - 1).toString();
              });
            }
          },
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 60,
          child: TextField(
            controller: _pomodoroCountController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            int currentValue = int.tryParse(_pomodoroCountController.text) ?? 1;
            setState(() {
              _pomodoroCountController.text = (currentValue + 1).toString();
            });
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  Future<void> _saveTask(BuildContext context) async {
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(LocaleKeys.Task_Title.tr())));
      return;
    }

    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      if (isEditing) {
        // 更新现有任务
        final updatedTask = widget.task!.copyWith(
          title: _titleController.text,
          pomodoroCount: int.tryParse(_pomodoroCountController.text) ?? 1,
          startTime: _startTimeController.text.isNotEmpty
              ? KDateUtils.parseDateTime(
                  _startTimeController.text,
                  pattern: 'yyyy-MM-dd',
                )
              : null,
          dueTime: _dueTimeController.text.isNotEmpty
              ? KDateUtils.parseDateTime(
                  _dueTimeController.text,
                  pattern: 'yyyy-MM-dd',
                )
              : null,
        );
        await ref
            .read(pomodoroTaskListProvider.notifier)
            .updateTask(updatedTask);
        scaffoldMessenger.showSnackBar(const SnackBar(content: Text('任务更新成功')));
      } else {
        // 创建新任务
        final newTask = PomodoroTask.create(
          title: _titleController.text,
          pomodoroCount: int.tryParse(_pomodoroCountController.text) ?? 1,
          startTime: _startTimeController.text.isNotEmpty
              ? KDateUtils.parseDateTime(
                  _startTimeController.text,
                  pattern: 'yyyy-MM-dd',
                )
              : null,
          dueTime: _dueTimeController.text.isNotEmpty
              ? KDateUtils.parseDateTime(
                  _dueTimeController.text,
                  pattern: 'yyyy-MM-dd',
                )
              : null,
          createdAt: DateTime.now(),
        );
        await ref.read(pomodoroTaskListProvider.notifier).createTask(newTask);
        scaffoldMessenger.showSnackBar(const SnackBar(content: Text('任务添加成功')));
      }
      navigator.pop();
    } catch (error) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text('操作失败: $error')));
    }
  }
}
