import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_skeleton/infrastructure/navigation/app_navigator.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/entity/todo.dart';
import 'package:flutter_clean_skeleton/modules/todo/presentation/blocs/priority_cubit.dart';
import 'package:flutter_clean_skeleton/modules/todo/presentation/blocs/selected_date_cubit.dart';
import 'package:flutter_clean_skeleton/modules/todo/presentation/blocs/todo_bloc.dart';
import 'package:flutter_minimalist/flutter_minimalist.dart';

import '../../business/use_cases/get_todo_list_use_case.dart';
import '../../business/use_cases/todo_create_use_case.dart';
import '../../data/data_sources/todo_local_data_source.dart';
import '../../data/repositories/todo_repository_impl.dart';
import '../widgets/form_title.dart';

class CreateTodoScreen extends StatelessWidget {
  CreateTodoScreen({super.key});

  final _todoRepository = TodoRepositoryImpl(dataSource: TodoLocalDataSource());

  final _formKey = GlobalKey<FormState>();

  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('New Todo'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: 16.allPadding,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormTitle(text: 'Title'),
                12.verticalSpace,
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (val) {
                    if (val?.isEmpty ?? true) return 'Required';
                    return null;
                  },
                  onSaved: (val) {
                    title = val ?? '';
                  },
                ),
                16.verticalSpace,
                const FormTitle(text: 'Description'),
                12.verticalSpace,
                TextFormField(
                  minLines: 3,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Enter Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (val) {
                    if (val?.isEmpty ?? true) return 'Required';
                    return null;
                  },
                  onSaved: (val) {
                    description = val ?? '';
                  },
                ),
                16.verticalSpace,
                const FormTitle(text: 'Priority'),
                12.verticalSpace,
                BlocProvider(
                  create: (context) => PriorityCubit(),
                  child: BlocBuilder<PriorityCubit, String>(
                    builder: (context, state) {
                      return DropdownButtonHideUnderline(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                            ),
                          ),
                          child: DropdownButton(
                            value: state,
                            isExpanded: true,
                            items: [
                              'Low',
                              'Medium',
                              'High',
                            ].map(
                                  (e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                        color: e == 'Low'
                                            ? Colors.green
                                            : e == 'Medium'
                                            ? Colors.orange
                                            : Colors.red,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (val) {
                              if (val == null) return;
                              context.read<PriorityCubit>().setPriority(val);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                16.verticalSpace,
                const FormTitle(text: 'End Date'),
                12.verticalSpace,
                BlocProvider(
                  create: (context) => SelectedDateCubit(),
                  child: Builder(
                      builder: (context) {
                        return InkWell(
                          onTap: () async {
                            final picked = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(const Duration(days: 730)),
                            );

                            if (picked != null) {
                              context.read<SelectedDateCubit>().setDate(picked);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1,
                                )),
                            child: BlocBuilder<SelectedDateCubit, DateTime>(
                              builder: (context, state) {
                                return Text(state.toString());
                              },
                            ),
                          ),
                        );
                      }
                  ),
                ),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocProvider(
                      create: (context) =>
                          TodoBloc(
                            todoCreateUseCase: TodoCreateUseCase(todoRepository: _todoRepository),
                            getTodoListUseCase: GetTodoListUseCase(todoRepository: _todoRepository),
                          ),
                      child: Builder(
                          builder: (context) {
                            return ElevatedButton(
                              onPressed: () async {
                                final formValid = _formKey.currentState?.validate();

                                if (formValid == false) {
                                  return;
                                }
                                _formKey.currentState?.save();

                                final todo = Todo(
                                  title: title,
                                  description: description,
                                  isDone: 0,
                                  priority: 1,
                                );

                                context.read<TodoBloc>().add(TodoCreateEvent(todo: todo));

                                AppNavigator.navKey.currentState?.pop();
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                                ),
                              ),
                              child: const Text('Save'),
                            );
                          }
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
