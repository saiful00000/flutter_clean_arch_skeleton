import '../entity/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getAllTodo();

  Future<bool> addTodo({required Map<String, dynamic> row});

  Future<bool> updateTodo({required int id, required Map<String, dynamic> row});

  Future<bool> deleteTodo({required int id});
}