part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {
  const TodoEvent();
}

class TodoInitialEvent extends TodoEvent {

}

/// THe event for getting todo list
class GetTodoListEvent extends TodoEvent {}

/// The event for creating a single todo
class TodoCreateEvent extends TodoEvent {
  final Todo todo;

  const TodoCreateEvent({required this.todo});
}

/// The event for deleting a todo
class TodoDeleteEvent extends TodoEvent {
  final Todo todo;

  const TodoDeleteEvent({required this.todo});
}

