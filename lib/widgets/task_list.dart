import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuraz/bloc/task_bloc.dart';
import 'package:kuraz/bloc/task_state.dart';
import 'package:kuraz/widgets/task_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state.tasks.isEmpty) {
          return const Center(child: Text('No tasks yet. Add a new task!'));
        }
        return ListView.builder(
          itemCount: state.filteredTasks.length,
          itemBuilder: (context, index) {
            final task = state.filteredTasks[index];
            return TaskItem(task: task);
          },
        );
      },
    );
  }
}

