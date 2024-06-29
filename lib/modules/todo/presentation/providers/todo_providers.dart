import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoPriorityProvider = StateProvider.autoDispose<String>((ref) => 'Low');
final todoDueDateProvider = StateProvider.autoDispose<DateTime>((ref) => DateTime.now());