import 'package:flutter_clean_skeleton/modules/todo/business/entity/todo.dart';

import '../../../../core/use_cases/async_use_case.dart';

import '../repository/todo_repository.dart';

class TodoCreateUseCase extends AsyncUseCase<Todo?, Todo> {

  final TodoRepository todoRepository;

  TodoCreateUseCase({required this.todoRepository});

  @override
  Future<Todo?> execute(Todo param) async {
    final id = await todoRepository.addTodo(todo: param);
    if (id == null) return null;
    return await todoRepository.getTodoById(id: id);
  }

}