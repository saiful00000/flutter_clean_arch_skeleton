import 'package:flutter_clean_skeleton/modules/todo/data/models/todo_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    int? id,
    required String title,
    String? description,
    required int isDone,
    String? dueDate,
    required int priority,
  }) = _Todo;

  factory Todo.fromModel(TodoModel e) {
    return Todo(
      id: e.id,
      title: e.title,
      description: e.description,
      isDone: e.isDone,
      dueDate: e.dueDate,
      priority: e.priority,
    );
  }
}
