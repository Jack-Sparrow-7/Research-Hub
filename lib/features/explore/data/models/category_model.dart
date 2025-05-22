import 'package:research_hub/features/explore/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.title,
    required super.sub_1,
    required super.sub_2,
    required super.image,
    required super.funded,
    required super.count,
    required super.description,
    required super.categoryId,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['title'],
      sub_1: map['sub_1'],
      sub_2: map['sub_2'],
      image: map['image'],
      funded: map['funded'],
      count: map['count'],
      description: map['description'],
      categoryId: map['category_id'],
    );
  }
}
