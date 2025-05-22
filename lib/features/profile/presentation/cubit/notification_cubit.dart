import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<bool> {
  NotificationCubit() : super(true);

  void onPressed(bool value) {
    emit(value);
  }
}