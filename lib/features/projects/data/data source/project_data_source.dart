import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:research_hub/features/projects/data/models/project_model.dart';
import 'package:research_hub/features/projects/domain/entities/project_entity.dart';

class ProjectDataSource {
  final FirebaseFirestore _firestore;

  ProjectDataSource({required FirebaseFirestore firestore})
    : _firestore = firestore;
  Future<List<ProjectEntity>> getProjects() async {
    final snapShot = await _firestore.collection('projects').get();
    return snapShot.docs
        .map((doc) => ProjectModel.fromMap(doc.data(), doc.id))
        .toList();
  }
}
