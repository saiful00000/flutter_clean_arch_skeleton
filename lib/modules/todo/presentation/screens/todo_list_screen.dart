import 'package:flutter/material.dart';
import 'package:flutter_clean_skeleton/infrastructure/navigation/app_navigator.dart';
import 'package:flutter_clean_skeleton/infrastructure/navigation/route_names.dart';

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
      body: ListView.builder(
        itemCount: 0,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container();
        },
      ),
    );
  }
}
