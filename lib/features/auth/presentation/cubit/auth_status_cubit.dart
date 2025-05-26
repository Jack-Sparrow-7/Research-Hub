import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthStatusCubit extends Cubit<bool> {
  AuthStatusCubit() : super(false);

  Future<void> checkAdminStatus({required String uid}) async {
    final doc =
        await FirebaseFirestore.instance.collection('admins').doc(uid).get();
    emit(doc.exists);
  }

  void onLogout() => emit(false);
}
