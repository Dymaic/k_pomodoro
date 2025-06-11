import 'package:isar/isar.dart';

part 'pomodoro_task.g.dart';

@collection
class PomodoroTask {
  Id id = Isar.autoIncrement;
  
  late String title;
  String? description;
  bool isCompleted = false;
  late DateTime? startTime;
  late DateTime? dueTime;
  late DateTime createdAt;
  DateTime? completedAt;
  int pomodoroCount = 0;

  PomodoroTask();

  PomodoroTask.create({
    required this.title,
    this.description,
    this.isCompleted = false,
    this.startTime,
    this.dueTime,
    required this.createdAt,
    this.completedAt,
    this.pomodoroCount = 0,
  });

  // 工厂方法
  factory PomodoroTask.empty() {
    return PomodoroTask.create(title: '',
      createdAt: DateTime.now(),
    );
  }

  // 复制方法
  PomodoroTask copyWith({
    Id? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? startTime,
    DateTime? dueTime,
    DateTime? createdAt,
    DateTime? completedAt,
    int? pomodoroCount,
  }) {
    final task = PomodoroTask.create(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      startTime: startTime ?? this.startTime,
      dueTime: dueTime ?? this.dueTime,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      pomodoroCount: pomodoroCount ?? this.pomodoroCount,
    );
    task.id = id ?? this.id;
    return task;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PomodoroTask &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          isCompleted == other.isCompleted &&
          startTime == other.startTime &&
          dueTime == other.dueTime &&
          createdAt == other.createdAt &&
          completedAt == other.completedAt &&
          pomodoroCount == other.pomodoroCount;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      isCompleted.hashCode ^
      startTime.hashCode ^
      dueTime.hashCode ^
      createdAt.hashCode ^
      completedAt.hashCode ^
      pomodoroCount.hashCode;

  @override
  String toString() {
    return 'PomodoroTask{id: $id, title: $title, description: $description, isCompleted: $isCompleted, startTime: $startTime, dueTime: $dueTime, createdAt: $createdAt, completedAt: $completedAt, pomodoroCount: $pomodoroCount}';
  }
}
