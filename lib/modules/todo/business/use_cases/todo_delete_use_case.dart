import 'package:flutter_clean_skeleton/core/use_cases/async_use_case.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/entity/todo.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/repository/todo_repository.dart';

class TodoDeleteUseCase extends AsyncUseCase<bool, Todo> {
  final TodoRepository todoRepository;

  TodoDeleteUseCase({required this.todoRepository});

  @override
  Future<bool> execute(Todo todo) async {
    return await todoRepository.deleteTodo(todo: todo);
  }
}
