import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuraz/bloc/task_bloc.dart';
import 'package:kuraz/bloc/task_event.dart';
import 'package:kuraz/screens/add_task_screen.dart';
import 'package:kuraz/widgets/task_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'all') {
                context.read<TaskBloc>().add(FilterTasks(showCompleted: null));
              } else if (value == 'completed') {
                context.read<TaskBloc>().add(FilterTasks(showCompleted: true));
              } else if (value == 'pending') {
                context.read<TaskBloc>().add(FilterTasks(showCompleted: false));
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'all',
                child: Text('All Tasks'),
              ),
              const PopupMenuItem<String>(
                value: 'completed',
                child: Text('Completed'),
              ),
              const PopupMenuItem<String>(
                value: 'pending',
                child: Text('Pending'),
              ),
            ],
          ),
        ],
      ),
      body: const Padding(padding: EdgeInsets.all(16.0), child: TaskList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

