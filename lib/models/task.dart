import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;

  Task({
    required this.title,
    required this.isCompleted,
    required this.createdAt,
    String? id,
  }) : id = id ?? Uuid().v4();

  @override
  List<Object?> get props => [id, title, isCompleted, createdAt];

  Task copyWith({String? title, bool? isCompleted, DateTime? createdAt}) {
    return Task(
      id: id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

