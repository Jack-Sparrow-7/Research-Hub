import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:research_hub/core/responsive/responsive_layout.dart';
import 'package:research_hub/features/explore/domain/entities/category_entity.dart';
import 'package:research_hub/features/explore/presentation/screens/category_desktop.dart';
import 'package:research_hub/features/explore/presentation/screens/category_mobile.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late final CategoryEntity categoryEntity;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final args = Get.arguments;
    categoryEntity = args['category'];
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: CategoryMobile(category: categoryEntity,),
      tablet: CategoryMobile(category: categoryEntity,),
      desktop: CategoryDesktop(),
    );
  }
}
