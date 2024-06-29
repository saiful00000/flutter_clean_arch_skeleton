import 'package:flutter_clean_skeleton/infrastructure/database/todo_database.dart';
import 'package:flutter_clean_skeleton/modules/todo/data/data_sources/todo_data_source.dart';
import 'package:flutter_clean_skeleton/modules/todo/data/models/todo_model.dart';

class TodoLocalDataSource implements TodoDataSource {
  @override
  Future<int> deleteTodo({required int id}) async {
    return await TodoDatabase.instance.deleteTodo(id);
  }

  @override
  Future<List<TodoModel>> getAllTodo() async {
    final jsonTodos = await TodoDatabase.instance.getAllTodos();
    return jsonTodos.map((element) => TodoModel.fromJson(element)).toList();
  }

  @override
  Future<int> insertTodo({required Map<String, dynamic> row}) async {
    return await TodoDatabase.instance.insertTodo(row);
  }

  @override
  Future<int> updateTodo({required int id, required Map<String, dynamic> row}) async {
    return await TodoDatabase.instance.updateTodo(id, row);
  }

}