import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedDateCubit extends Cubit<DateTime> {
  SelectedDateCubit(): super(DateTime.now());

  void setDate(DateTime data) => emit(data);
}