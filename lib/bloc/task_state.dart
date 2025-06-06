import 'package:equatable/equatable.dart';
import 'package:kuraz/models/task.dart';

class TaskState extends Equatable {
  final List<Task> tasks;
  final bool? showCompleted;

  const TaskState({this.tasks = const [], this.showCompleted});

  List<Task> get filteredTasks {
    if (showCompleted == null) return tasks;
    return tasks.where((task) => task.isCompleted == showCompleted).toList();
  }

  @override
  List<Object?> get props => [tasks, showCompleted];

  TaskState copyWith({List<Task>? tasks, bool? showCompleted}) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      showCompleted: showCompleted ?? this.showCompleted,
    );
  }
}

