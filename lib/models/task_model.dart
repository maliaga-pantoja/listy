import 'package:flutter/material.dart';

class Task {
  final String id;
  final String title;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final Color color;
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.color,
    this.isCompleted = false,
  });
}

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      id: '1',
      title: 'Reunión de equipo',
      date: DateTime(2023, 10, 1),
      startTime: const TimeOfDay(hour: 10, minute: 0),
      endTime: const TimeOfDay(hour: 11, minute: 30),
      color: const Color(0xFF137FEC),
    ),
    Task(
      id: '2',
      title: 'Revisión de diseño UI',
      date: DateTime(2023, 10, 3),
      startTime: const TimeOfDay(hour: 14, minute: 0),
      endTime: const TimeOfDay(hour: 15, minute: 0),
      color: Colors.amber,
    ),
    Task(
      id: '3',
      title: 'Gimnasio',
      date: DateTime(2023, 10, 5),
      startTime: const TimeOfDay(hour: 18, minute: 0),
      endTime: const TimeOfDay(hour: 19, minute: 30),
      color: Colors.teal,
      isCompleted: true,
    ),
    Task(
      id: '4',
      title: 'Presentación cliente',
      date: DateTime(2023, 10, 8),
      startTime: const TimeOfDay(hour: 9, minute: 0),
      endTime: const TimeOfDay(hour: 10, minute: 0),
      color: Colors.purple,
    ),
    Task(
      id: '5',
      title: 'Reunión de proyecto',
      date: DateTime(2023, 10, 11),
      startTime: const TimeOfDay(hour: 11, minute: 0),
      endTime: const TimeOfDay(hour: 12, minute: 0),
      color: const Color(0xFF137FEC),
    ),
    Task(
      id: '6',
      title: 'Entrega de documentación',
      date: DateTime(2023, 10, 16),
      startTime: const TimeOfDay(hour: 16, minute: 0),
      endTime: const TimeOfDay(hour: 17, minute: 0),
      color: Colors.green,
    ),
    Task(
      id: '7',
      title: 'Revisión de código',
      date: DateTime(2023, 10, 20),
      startTime: const TimeOfDay(hour: 13, minute: 0),
      endTime: const TimeOfDay(hour: 14, minute: 0),
      color: Colors.orange,
    ),
  ];

  List<Task> get tasks => _tasks;

  List<Task> getTasksForDay(DateTime day) {
    return _tasks
        .where(
          (task) =>
              task.date.year == day.year &&
              task.date.month == day.month &&
              task.date.day == day.day,
        )
        .toList();
  }

  List<int> getDaysWithTasks(int month, int year) {
    return _tasks
        .where((task) => task.date.month == month && task.date.year == year)
        .map((task) => task.date.day)
        .toList();
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTaskCompletion(String taskId) {
    final index = _tasks.indexWhere((t) => t.id == taskId);
    if (index != -1) {
      _tasks[index] = Task(
        id: _tasks[index].id,
        title: _tasks[index].title,
        date: _tasks[index].date,
        startTime: _tasks[index].startTime,
        endTime: _tasks[index].endTime,
        color: _tasks[index].color,
        isCompleted: !_tasks[index].isCompleted,
      );
      notifyListeners();
    }
  }
}
