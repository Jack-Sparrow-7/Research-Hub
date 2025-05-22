import 'package:research_hub/features/explore/domain/entities/category_entity.dart';
import 'package:research_hub/features/explore/domain/repositories/explore_repository.dart';

class GetCategoriesUsecase {
  final ExploreRepository _exploreRepository;

  GetCategoriesUsecase({required ExploreRepository exploreRepository})
    : _exploreRepository = exploreRepository;

  Future<List<CategoryEntity>> call() async {
    return await _exploreRepository.getCategories();
  }
}
