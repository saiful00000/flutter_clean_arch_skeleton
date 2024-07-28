import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_clean_skeleton/core/use_cases/no_param.dart';
import 'package:flutter_clean_skeleton/modules/todo/presentation/blocs/todo_status.dart';
import 'package:meta/meta.dart';

import '../../business/entity/todo.dart';
import '../../business/use_cases/get_todo_list_use_case.dart';
import '../../business/use_cases/todo_create_use_case.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodoListUseCase getTodoListUseCase;
  final TodoCreateUseCase todoCreateUseCase;

  TodoBloc({
    required this.getTodoListUseCase,
    required this.todoCreateUseCase,
  }) : super(TodoState()) {
    on<GetTodoListEvent>(_getTodoList);
    on<TodoCreateEvent>(_createTodo);
    on<TodoDeleteEvent>(_deleteTodo);
  }

  Future<void> _getTodoList(GetTodoListEvent event, Emitter<TodoState> emit) async {
    try {
      emit(TodoState(status: TodoStatus.loading, message: "Loading data."));
      final todoList = await getTodoListUseCase.execute(NoParam());
      return emit(TodoState(todos: todoList, status: TodoStatus.success));
    } catch (error, stck) {
      emit(TodoState(status: TodoStatus.error, message: 'Failed to get data.'));
    }
  }

  Future<void> _createTodo(TodoCreateEvent event, Emitter<TodoState> emit) async {
    try {
      final createdTodo = await todoCreateUseCase.execute(event.todo);
      if (createdTodo != null) {
        final oldTodos = state.todos;
        oldTodos.insert(0, createdTodo);
        emit(state.copyWith(todos: oldTodos, status: TodoStatus.success));
      }else {
        emit(state.copyWith(status: TodoStatus.error, message: 'Todo creation failed.'));
      }
    } catch (error, stck) {
      emit(state.copyWith(status: TodoStatus.error, message: 'Todo creation failed.'));
    }
  }

  FutureOr<void> _deleteTodo(TodoDeleteEvent event, Emitter<TodoState> emit) {
    try {} catch (error, stck) {}
  }
}
