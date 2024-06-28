import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  int? id;
  String title;
  String? description;
  int isDone;
  String? dueDate;
  int priority;

  TodoModel({
    this.id,
    required this.title,
    required this.description,
    required this.isDone,
    this.dueDate,
    required this.priority,
  });

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
