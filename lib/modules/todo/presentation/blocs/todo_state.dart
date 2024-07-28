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

  TodoState copyWith({TodoStatus? status, List<Todo>? todos, String? message,}) {
    return TodoState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
      message: message ?? this.message,
    );
  }
}
