part of 'todo_bloc.dart';

class TodoState {
  final TodoStatus status;
  final List<Todo> todos;
  final String message;

  TodoState({
    this.status = TodoStatus.initial,
    this.todos = const <Todo>[],
    this.message = '',
  });
}
