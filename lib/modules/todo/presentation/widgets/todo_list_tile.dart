import 'package:flutter/material.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/entity/todo.dart';

class TodoListTile extends StatelessWidget {

  final Todo todo;

  const TodoListTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title, style: TextStyle(color: Colors.red),),
      subtitle: Text(todo.description ?? ''),
    );
  }
}
