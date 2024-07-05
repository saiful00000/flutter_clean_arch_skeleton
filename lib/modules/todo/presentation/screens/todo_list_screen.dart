import 'package:flutter/material.dart';
import 'package:flutter_clean_skeleton/infrastructure/navigation/app_navigator.dart';
import 'package:flutter_clean_skeleton/infrastructure/navigation/route_names.dart';
import 'package:flutter_clean_skeleton/modules/todo/presentation/providers/async_todo_list.dart';
import 'package:flutter_clean_skeleton/modules/todo/presentation/widgets/todo_list_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todos'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          AppNavigator.navKey.currentState?.pushNamed(RouteNames.createTodoScreen);
        },
      ),
      body: Consumer(builder: (context, ref, _) {
        final asyncTodoList = ref.watch(asyncTodoListProvider);

        return asyncTodoList.when(
          data: (todoList) {
            return ListView.builder(
              itemCount: todoList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return TodoListTile(todo: todoList[index]);
              },
            );
          },
          error: (error, stck) {
            return const SizedBox();
          },
          loading: () => const Center(child: CircularProgressIndicator(),),
        );
      }),
    );
  }
}
