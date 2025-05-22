import 'package:research_hub/features/explore/data/data%20source/explore_data_source.dart';
import 'package:research_hub/features/explore/domain/entities/category_entity.dart';
import 'package:research_hub/features/explore/domain/repositories/explore_repository.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  final ExploreDataSource _exploreDataSource;

  ExploreRepositoryImpl({required ExploreDataSource exploreDataSource}) : _exploreDataSource = exploreDataSource;


  @override
  Future<List<CategoryEntity>> getCategories() async {
    return await _exploreDataSource.getCategories();
  }
}
