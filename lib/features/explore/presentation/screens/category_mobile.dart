import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/features/explore/domain/entities/category_entity.dart';
import 'package:research_hub/features/projects/presentation/widgets/project_card.dart';
import 'package:research_hub/features/projects/presentation/bloc/project_bloc.dart';

import '../../../../core/constants/color_pallete.dart';

class CategoryMobile extends StatelessWidget {
  final CategoryEntity category;
  const CategoryMobile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.scaffoldColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Text(
          "Research Hub",
          style: GoogleFonts.pacifico(
            fontSize: 27.w,
            color: ColorPallete.primaryColor,
          ),
        ),
      ),
      body: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          if (state is ProjectsLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorPallete.primaryColor,
              ),
            );
          } else if (state is ProjectsError) {
            return Center(child: Text(state.errorMessage));
          } else if (state is ProjectsLoaded) {
            final groupedProjects = state.groupedProjects;
            final categoryProjects = groupedProjects[category.categoryId];
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${category.title} Projects",
                    style: GoogleFonts.inter(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(10.w),
                  Text(
                    category.description,
                    style: GoogleFonts.inter(fontSize: 18.sp),
                  ),
                  Gap(20.w),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20.w),
                      fixedSize: Size.fromWidth(400.w),
                      backgroundColor: ColorPallete.primaryColor,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => Get.back(),
                    label: Text(
                      "Back to Explore",
                      style: GoogleFonts.inter(
                        fontSize: 20.w,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    icon: Icon(Icons.arrow_back, size: 25.w),
                  ),
                  Gap(35.w),
                  Column(
                    children: List.generate(categoryProjects!.length, (index) {
                      final project = categoryProjects[index];
                      return ProjectCard(
                        project: project,
                        category: category.title,
                        subCategory1: category.sub_1,
                        subCategory2: category.sub_2,
                      );
                    }),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
