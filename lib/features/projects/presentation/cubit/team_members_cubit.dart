import 'package:flutter_bloc/flutter_bloc.dart';

class TeamMembersCubit extends Cubit<List<Map<String, dynamic>>> {
  TeamMembersCubit()
      : super([
          {'name': '', 'role': ''},
        ]);

  void addMember() {
    final updatedList = List<Map<String, dynamic>>.from(state)
      ..add({'name': '', 'role': ''});
    emit(updatedList);
  }

  void removeMember({required int index}) {
    final updatedList = List<Map<String, dynamic>>.from(state)
      ..removeAt(index);
    emit(updatedList);
  }
}
