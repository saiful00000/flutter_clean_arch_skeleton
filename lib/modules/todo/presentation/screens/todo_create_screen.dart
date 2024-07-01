import 'package:flutter/material.dart';
import 'package:flutter_clean_skeleton/modules/todo/business/use_cases/todo_create_use_case.dart';
import 'package:flutter_clean_skeleton/modules/todo/data/data_sources/todo_local_data_source.dart';
import 'package:flutter_clean_skeleton/modules/todo/data/repositories/todo_repository_impl.dart';
import 'package:flutter_clean_skeleton/modules/todo/presentation/controllers/todo_create_controller.dart';
import 'package:flutter_clean_skeleton/modules/todo/presentation/providers/todo_providers.dart';
import 'package:flutter_clean_skeleton/modules/todo/presentation/widgets/form_title.dart';
import 'package:flutter_minimalist/flutter_minimalist.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateTodoScreen extends ConsumerWidget {
  CreateTodoScreen({super.key});

  TodoCreateController? _todoCreateController;

  final _formKey = GlobalKey<FormState>();

  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _todoCreateController = TodoCreateController(
      context: context,
      ref: ref,
      todoCreateUseCase: TodoCreateUseCase(
        todoRepository: TodoRepositoryImpl(
          dataSource: TodoLocalDataSource(),
        ),
      ),
    );

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
                Consumer(builder: (context, ref, _) {
                  final selectedPriority = ref.watch(todoPriorityProvider);

                  return DropdownButtonHideUnderline(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                        ),
                      ),
                      child: DropdownButton(
                        value: selectedPriority,
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
                          ref.read(todoPriorityProvider.notifier).state = val;
                        },
                      ),
                    ),
                  );
                }),
                16.verticalSpace,
                const FormTitle(text: 'End Date'),
                12.verticalSpace,
                Consumer(
                  builder: (context, ref, _) {
                    final selectedDate = ref.watch(todoDueDateProvider);

                    return InkWell(
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 730)),
                        );

                        if (picked != null) {
                          ref.read(todoDueDateProvider.notifier).state = picked;
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
                        child: Text(selectedDate.toString()),
                      ),
                    );
                  },
                ),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final result = await _todoCreateController?.createTodo(
                          title: title,
                          description: description,
                          priority: ref.read(todoPriorityProvider.notifier).state,
                          dueDate: ref.read(todoDueDateProvider.notifier).state.toString(),
                        );

                        if(result == true) {
                          _formKey.currentState?.reset();
                          ref.invalidate(todoPriorityProvider);
                          ref.invalidate(todoDueDateProvider);
                        }

                      },
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        ),
                      ),
                      child: const Text('Save'),
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
