import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/features/explore/presentation/bloc/explore_bloc.dart';
import 'package:research_hub/features/explore/presentation/widgets/app_search_bar.dart';
import 'package:research_hub/features/explore/presentation/widgets/category_card.dart';

class ExploreBodyMobile extends StatefulWidget {
  const ExploreBodyMobile({super.key});

  @override
  State<ExploreBodyMobile> createState() => _ExploreBodyMobileState();
}

class _ExploreBodyMobileState extends State<ExploreBodyMobile> {
  final List<String> items = [
    'Agriculture Solutions',
    'Educational Technology',
    'Healthcare Innovations',
    'Environmental Projects',
    'Smart City Solutions',
    'Social Impact Initiatives',
    'Technology Innovation',
    'Community Development',
  ];

  List<String> filteredItems = [];

  final searchController = SearchController();

  @override
  void initState() {
    filteredItems = items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CategoriesLoaded) {
          final categoriesList = state.categories;
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.w),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Explore Projects 🔍",
                    style: GoogleFonts.inter(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Gap(15.w),
                Text(
                  "Discover innovative student projects across various technology categorys",
                  style: GoogleFonts.inter(fontSize: 16.sp),
                ),
                Gap(45.w),
                AppSearchBar(searchController: searchController, items: items),
                Gap(40.w),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Project Categories",
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Gap(30.w),
                Column(
                  children: List.generate(categoriesList.length, (index) {
                    final category = categoriesList[index];
                    return CategoryCard(category: category);
                  }),
                ),
              ],
            ),
          );
        } else if (state is CategoriesError) {
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      },
    );
  }
}




