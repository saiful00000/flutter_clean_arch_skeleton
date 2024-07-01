import 'package:flutter_clean_skeleton/modules/todo/business/entity/todo.dart';

import '../../../../core/use_cases/async_use_case.dart';
import '../../../../core/use_cases/no_param.dart';

import '../repository/todo_repository.dart';

class TodoCreateUseCase extends AsyncUseCase<bool, Todo> {

  final TodoRepository todoRepository;

  TodoCreateUseCase({required this.todoRepository});

  @override
  Future<bool> execute(Todo param) async {
    return await todoRepository.addTodo(todo: param);
  }

}