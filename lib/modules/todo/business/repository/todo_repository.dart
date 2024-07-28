import '../entity/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getAllTodo();

  Future<int?> addTodo({required Todo todo});

  Future<bool> updateTodo({required Todo todo});

  Future<bool> deleteTodo({required Todo todo});

  Future<Todo?> getTodoById({required int id});
}