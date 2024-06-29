import '../models/todo_model.dart';

abstract class TodoDataSource {
  Future<List<TodoModel>> getAllTodo();

  Future<int> insertTodo({required Map<String, dynamic> row});

  Future<int> updateTodo({required int id, required Map<String, dynamic> row});

  Future<int> deleteTodo({required int id});
}
