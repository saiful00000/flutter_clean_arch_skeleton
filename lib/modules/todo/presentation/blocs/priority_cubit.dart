import 'package:bloc/bloc.dart';

class PriorityCubit extends Cubit<String> {
  PriorityCubit() : super('Low');

  void setPriority(String priority) => emit(priority);

}
