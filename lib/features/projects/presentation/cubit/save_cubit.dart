import 'package:flutter_bloc/flutter_bloc.dart';

class SaveCubit extends Cubit<bool> {
  SaveCubit() : super(false);

  void onPressed() => emit(!state);
}
