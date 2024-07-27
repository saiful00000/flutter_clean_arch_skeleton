import 'package:bloc/bloc.dart';
import 'package:flutter_clean_skeleton/core/use_cases/no_param.dart';
import 'package:flutter_clean_skeleton/modules/todo/presentation/blocs/todo_status.dart';
import 'package:meta/meta.dart';

import '../../business/entity/todo.dart';
import '../../business/use_cases/get_todo_list_use_case.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodoListUseCase getTodoListUseCase;

  TodoBloc({
    required this.getTodoListUseCase,
  }) : super(TodoState()) {
    on<GetTodoListEvent>(_getTodoList);
  }

  Future<void> _getTodoList(GetTodoListEvent event, Emitter<TodoState> emitter) async {
    try {
      emitter(TodoState(status: TodoStatus.loading, message: "Loading data."));
      final todoList = await getTodoListUseCase.execute(NoParam());
      return emitter(TodoState(todos: todoList, status: TodoStatus.success));
    } catch (e, stck) {
      emitter(TodoState(status: TodoStatus.error, message: 'Failed to get data.'));
    }
  }
}
