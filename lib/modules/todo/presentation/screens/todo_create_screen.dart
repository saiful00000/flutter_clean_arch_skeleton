import 'package:flutter/material.dart';
import 'package:flutter_clean_skeleton/modules/todo/presentation/widgets/form_title.dart';
import 'package:flutter_minimalist/flutter_minimalist.dart';

class CreateTodoScreen extends StatelessWidget {
  CreateTodoScreen({super.key});

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
                      title = val ?? '';
                    },
                  ),
                  16.verticalSpace,


                  24.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
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
        ));
  }
}
