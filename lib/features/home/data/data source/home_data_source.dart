import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:research_hub/features/home/data/models/dash_board_model.dart';
import 'package:research_hub/features/home/data/models/domain_model.dart';
import 'package:research_hub/features/home/domain/entities/dash_board_entitiy.dart';
import 'package:research_hub/features/home/domain/entities/domain_entitiy.dart';

class HomeDataSource {
  final FirebaseFirestore _firestore;

  HomeDataSource({required FirebaseFirestore firestore})
    : _firestore = firestore;

  Future<List<DashBoardEntitiy>> getDashBoard() async {
    final snapShot = await _firestore.collection('dash_board').get();
    return snapShot.docs
        .map((doc) => DashBoardModel.fromMap(doc.data()))
        .toList();
  }

  Future<List<DomainEntitiy>> getDomains() async {
    final snapShot = await _firestore.collection('domains').get();
    return snapShot.docs.map((doc) => DomainModel.fromMap(doc.data())).toList();
  }
}