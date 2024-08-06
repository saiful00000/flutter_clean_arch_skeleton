import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/use_cases/todo_create_use_case.dart';

import '../../../../infrastructure/navigation/app_navigator.dart';
import '../../../../infrastructure/navigation/route_names.dart';
import '../../business/use_cases/get_todo_list_use_case.dart';
import '../../data/data_sources/todo_local_data_source.dart';
import '../../data/repositories/todo_repository_impl.dart';
import '../blocs/todo_bloc.dart';
import '../blocs/todo_status.dart';
import '../widgets/todo_list_tile.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final _todoRepository = TodoRepositoryImpl(dataSource: TodoLocalDataSource());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return TodoBloc(
            todoCreateUseCase: TodoCreateUseCase(todoRepository: _todoRepository),
            getTodoListUseCase: GetTodoListUseCase(todoRepository: _todoRepository),
          )..add(GetTodoListEvent());
        },
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            switch (state.status) {
              case TodoStatus.initial:
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                ));
              case TodoStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case TodoStatus.error:
                return Center(child: Text(state.message));
              case TodoStatus.success:
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<TodoBloc>().add(GetTodoListEvent());
                  },
                  child: Scaffold(
                    appBar: AppBar(
                      centerTitle: true,
                      title: const Text('Todos'),
                    ),
                    floatingActionButton: FloatingActionButton(
                      child: const Icon(Icons.add),
                      onPressed: () async {
                        await AppNavigator.navKey.currentState?.pushNamed(RouteNames.createTodoScreen);
                        context.read<TodoBloc>().add(GetTodoListEvent());
                      },
                    ),
                    body: ListView.builder(
                      itemCount: state.todos.length,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return TodoListTile(
                          todo: state.todos[index],
                          onDelete: (todo) {

                          },
                        );
                      },
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
