import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_skeleton/infrastructure/navigation/app_navigator.dart';
import 'package:flutter_clean_skeleton/infrastructure/navigation/route_names.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/use_cases/get_todo_list_use_case.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/use_cases/todo_delete_use_case.dart';
import 'package:flutter_clean_skeleton/modules/todo/data/data_sources/todo_local_data_source.dart';
import 'package:flutter_clean_skeleton/modules/todo/data/repositories/todo_repository_impl.dart';
import 'package:flutter_clean_skeleton/modules/todo/presentation/blocs/todo_status.dart';
import 'package:flutter_clean_skeleton/modules/todo/presentation/controllers/todo_delete_controller.dart';

import '../blocs/todo_bloc.dart';
import '../widgets/todo_list_tile.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  TodoDeleteController? _todoDeleteController;

  @override
  void initState() {
    _todoDeleteController = TodoDeleteController(
      context: context,
      todoDeleteUseCase: TodoDeleteUseCase(
        todoRepository: TodoRepositoryImpl(
          dataSource: TodoLocalDataSource(),
        ),
      ),
    );

    super.initState();
  }

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
      body: BlocProvider(
        create: (context) {
          return TodoBloc(
            getTodoListUseCase: GetTodoListUseCase(
              todoRepository: TodoRepositoryImpl(
                dataSource: TodoLocalDataSource(),
              ),
            ),
          )..add(GetTodoListEvent());
        },
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {

            switch (state.status) {
              case TodoStatus.initial:
                return const Center(child: CircularProgressIndicator(color: Colors.red,));
              case TodoStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case TodoStatus.error:
                return Center(child: Text(state.message));
              case TodoStatus.success:
                return ListView.builder(
                  itemCount: state.todos.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TodoListTile(
                      todo: state.todos[index],
                      onDelete: (todo) {
                        _todoDeleteController?.deleteTodo(todo: state.todos[index]);
                      },
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
