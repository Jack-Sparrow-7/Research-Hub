import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:research_hub/features/explore/data/models/category_model.dart';
import 'package:research_hub/features/explore/domain/entities/category_entity.dart';

class ExploreDataSource {
  final FirebaseFirestore _firestore;

  ExploreDataSource({required FirebaseFirestore firestore})
    : _firestore = firestore;
  Future<List<CategoryEntity>> getCategories() async {
    final snapShot = await _firestore.collection('categories').get();
    return snapShot.docs
        .map((doc) => CategoryModel.fromMap(doc.data()))
        .toList();
  }
}
