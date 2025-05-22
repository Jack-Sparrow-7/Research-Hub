import 'package:research_hub/features/explore/domain/entities/category_entity.dart';

abstract interface class ExploreRepository {
  Future<List<CategoryEntity>> getCategories();
}
