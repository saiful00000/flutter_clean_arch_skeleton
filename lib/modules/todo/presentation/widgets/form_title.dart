import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {

  final String text;

  const FormTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
