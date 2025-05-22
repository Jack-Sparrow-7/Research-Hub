import 'package:flutter_bloc/flutter_bloc.dart';

class HideTextCubit extends Cubit<bool> {
  HideTextCubit() : super(true);

  void onPressed() => emit(!state);
}