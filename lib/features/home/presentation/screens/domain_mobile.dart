import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/features/home/domain/entities/domain_entitiy.dart';
import 'package:research_hub/features/projects/presentation/widgets/project_card.dart';
import 'package:research_hub/features/projects/presentation/bloc/project_bloc.dart';

import '../../../../core/constants/color_pallete.dart';

class DomainMobile extends StatelessWidget {
  final DomainEntitiy domain;
  const DomainMobile({super.key, required this.domain});

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
            final domainProjects = groupedProjects[domain.domainId];
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${domain.title} Projects",
                    style: GoogleFonts.inter(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(10.w),
                  Text(
                    domain.description,
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
                      "Back to Home",
                      style: GoogleFonts.inter(
                        fontSize: 20.w,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    icon: Icon(Icons.arrow_back, size: 25.w),
                  ),
                  Gap(35.w),
                  Column(
                    children: List.generate(domainProjects!.length, (index) {
                      final project = domainProjects[index];
                      return ProjectCard(
                        project: project,
                        domain: domain.title,
                        subDomain1: domain.sub_1,
                        subDomain2: domain.sub_2,
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
