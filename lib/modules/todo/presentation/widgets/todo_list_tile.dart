import 'package:flutter/material.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/entity/todo.dart';

class TodoListTile extends StatelessWidget {

  final Todo todo;
  final Function(Todo todo)? onDelete;

  const TodoListTile({super.key, required this.todo, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title, style: const TextStyle(color: Colors.red),),
      subtitle: Text(todo.description ?? ''),
      trailing:  InkResponse(
        onTap: () {
          onDelete?.call(todo);
        },
        child: const Icon(Icons.delete, color: Colors.red,),
      ),
    );
  }
}
