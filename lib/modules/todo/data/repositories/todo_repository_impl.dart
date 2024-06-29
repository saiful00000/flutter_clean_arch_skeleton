import 'package:flutter/foundation.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/entity/todo.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/repository/todo_repository.dart';
import 'package:flutter_clean_skeleton/modules/todo/data/data_sources/todo_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource dataSource;

  const TodoRepositoryImpl({required this.dataSource});

  @override
  Future<bool> deleteTodo({required int id}) async {
    try {
      final effectedRows = await dataSource.deleteTodo(id: id);
      return effectedRows > 0;
    } catch (error, stck) {
      debugPrint(error.toString());
      debugPrint(stck.toString());

      return false;
    }
  }

  @override
  Future<List<Todo>> getAllTodo() async {
    try {
      final todoModels = await dataSource.getAllTodo();

      return todoModels.map((e) => Todo.fromModel(e)).toList();
    } catch (error, stck) {
      debugPrint(error.toString());
      debugPrint(stck.toString());
      return [];
    }
  }

  @override
  Future<bool> addTodo({required Map<String, dynamic> row}) async {
    try {
      final insertedRow = await dataSource.insertTodo(row: row);
      return insertedRow > 0;
    } catch (error, stck) {
      debugPrint(error.toString());
      debugPrint(stck.toString());

      return false;
    }
  }

  @override
  Future<bool> updateTodo({required int id, required Map<String, dynamic> row}) async {
    try {
      final effectedRows = await dataSource.updateTodo(id: id, row: row);
      return effectedRows > 0;
    } catch (error, stck) {
      debugPrint(error.toString());
      debugPrint(stck.toString());

      return false;
    }
  }
}
