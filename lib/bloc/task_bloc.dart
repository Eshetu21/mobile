import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuraz/bloc/task_event.dart';
import 'package:kuraz/bloc/task_state.dart';
import 'package:kuraz/models/task.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<ToggleTask>(_onToggleTask);
    on<FilterTasks>(_onFilterTasks);
  }

  FutureOr<void> _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) {
    emit(state.copyWith(tasks: []));
  }

  FutureOr<void> _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final tasks = List<Task>.from(state.tasks)..add(event.task);
    emit(state.copyWith(tasks: tasks));
  }

  FutureOr<void> _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final index = state.tasks.indexWhere((task) => task.id == event.task.id);
    if (index != -1) {
      final tasks = List<Task>.from(state.tasks);
      tasks[index] = event.task;
      emit(state.copyWith(tasks: tasks));
    }
  }

  FutureOr<void> _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final tasks = state.tasks.where((task) => task.id != event.id).toList();
    emit(state.copyWith(tasks: tasks));
  }

  FutureOr<void> _onToggleTask(ToggleTask event, Emitter<TaskState> emit) {
    final index = state.tasks.indexWhere((task) => task.id == event.id);
    if (index != -1) {
      final task = state.tasks[index];
      final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
      final tasks = List<Task>.from(state.tasks);
      tasks[index] = updatedTask;
      emit(state.copyWith(tasks: tasks));
    }
  }

  FutureOr<void> _onFilterTasks(FilterTasks event, Emitter<TaskState> emit) {
    emit(state.copyWith(showCompleted: event.showCompleted));
  }
}

