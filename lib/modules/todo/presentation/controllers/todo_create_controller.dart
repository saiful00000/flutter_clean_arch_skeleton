import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_skeleton/infrastructure/navigation/app_navigator.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/entity/todo.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/use_cases/todo_create_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoCreateController {
  final WidgetRef ref;
  final BuildContext context;
  final TodoCreateUseCase todoCreateUseCase;

  const TodoCreateController({
    required this.context,
    required this.ref,
    required this.todoCreateUseCase,
  });

  Future<bool> createTodo({
    required String title,
    required String description,
    required String priority,
    required String dueDate,
  }) async {
    final todo = Todo(
      title: title,
      description: description,
      isDone: 0,
      priority: priority == 'High' ? 3 : priority == 'Medium' ? 2 : 1,
      createdAt: DateTime.now().toString(),
      dueDate: dueDate,
    );

    final result = await todoCreateUseCase.execute(todo);

    if(result) {
      AppNavigator.scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(content: Text('Todo Created!'), backgroundColor: Colors.green,),
      );
    }else {
      AppNavigator.scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(content: Text('Todo Creation Failed.'), backgroundColor: Colors.red,),
      );
    }

    return result;
  }
}
