import 'package:kuraz/models/task.dart';

abstract class TaskEvent {}

class LoadTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final Task task;

  AddTask(this.task);
}

class UpdateTask extends TaskEvent {
  final Task task;

  UpdateTask(this.task);
}

class DeleteTask extends TaskEvent {
  final String id;

  DeleteTask(this.id);
}

class ToggleTask extends TaskEvent {
  final String id;

  ToggleTask(this.id);
}

class FilterTasks extends TaskEvent {
  final bool? showCompleted;

  FilterTasks({this.showCompleted});
}

