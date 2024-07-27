import 'package:flutter/material.dart';
import 'package:flutter_clean_skeleton/infrastructure/navigation/app_navigator.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/entity/todo.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/use_cases/todo_delete_use_case.dart';

class TodoDeleteController {
  final BuildContext context;
  final TodoDeleteUseCase todoDeleteUseCase;

  const TodoDeleteController({
    required this.context,
    required this.todoDeleteUseCase,
  });

  Future<void> deleteTodo({required Todo todo}) async {
    final result = await todoDeleteUseCase.execute(todo);
    if (result) {
      /// Show success snack bar
      AppNavigator.scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text('Todo deleted.'),
          backgroundColor: Colors.green,
        ),
      );
    }else {
      /// Show failed snack bar
      AppNavigator.scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text('Todo deletion failed.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
