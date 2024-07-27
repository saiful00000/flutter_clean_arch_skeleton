import 'package:flutter_clean_skeleton/core/use_cases/async_use_case.dart';
import 'package:flutter_clean_skeleton/core/use_cases/no_param.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/entity/todo.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/repository/todo_repository.dart';

class GetTodoListUseCase extends AsyncUseCase<List<Todo>, NoParam> {
  final TodoRepository todoRepository;

  const GetTodoListUseCase({required this.todoRepository});

  @override
  Future<List<Todo>> execute(NoParam param) async {
    return await todoRepository.getAllTodo();
  }
}