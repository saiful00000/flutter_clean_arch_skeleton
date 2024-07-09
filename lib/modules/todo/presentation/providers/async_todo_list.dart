
import 'package:flutter_clean_skeleton/modules/todo/business/entity/todo.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/repository/todo_repository.dart';
import 'package:flutter_clean_skeleton/modules/todo/data/data_sources/todo_local_data_source.dart';
import 'package:flutter_clean_skeleton/modules/todo/data/repositories/todo_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_todo_list.g.dart';

@riverpod
class AsyncTodoList extends _$AsyncTodoList {

  late final TodoRepository _repository;

  @override
  Future<List<Todo>> build() async {
    _repository = TodoRepositoryImpl(dataSource: TodoLocalDataSource());

    return await _repository.getAllTodo();
  }

  Future<void> refreshTodoList() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _repository.getAllTodo());
  }

}