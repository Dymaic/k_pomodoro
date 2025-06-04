import 'dart:async';
import 'package:k_pomodoro/features/pomodoro/domain/entities/pomodoro_task.dart';
import 'package:k_pomodoro/features/pomodoro/domain/repositories/pomodoro/pomodoro_task_local_repo.dart';

class PomodoroService {
  final PomodoroTaskLocalRepo _repository;

  PomodoroService(this._repository);

  // Create operation
  Future<int> createTask(PomodoroTask task) async {
    return await _repository.createTask(task);
  }

  // Read operations
  Future<List<PomodoroTask>> getAllTasks() async {
    return await _repository.getAllTasks();
  }

  Future<PomodoroTask?> getTaskById(int id) async {
    return await _repository.getTaskById(id);
  }

  // Update operation
  Future<int> updateTask(PomodoroTask task) async {
    return await _repository.updateTask(task);
  }

  // Delete operations
  Future<bool> deleteTask(int id) async {
    return await _repository.deleteTask(id);
  }

  Future<int> deleteAllTasks() async {
    return await _repository.deleteAllTasks();
  }
}