import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    int? id,
    required String title,
    String? description,
    required int isDone,
    String? dueDate,
    required int priority,
  }) = _Todo;
}
