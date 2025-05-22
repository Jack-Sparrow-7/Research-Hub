import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:research_hub/core/constants/color_pallete.dart';
import 'package:research_hub/core/constants/svg_icons.dart';
import 'package:research_hub/features/projects/domain/entities/project_entity.dart';
import 'package:research_hub/features/projects/presentation/cubit/save_cubit.dart';

class ProjectMobile extends StatelessWidget {
  const ProjectMobile({super.key, required this.project});

  final ProjectEntity project;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SaveCubit(),
      child: Scaffold(
        backgroundColor: ColorPallete.scaffoldColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: Text("Research Hub"),
          titleTextStyle: GoogleFonts.pacifico(
            color: ColorPallete.primaryColor,
            fontSize: 27.w,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(25.w),
                      width: 400.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10.r,
                            spreadRadius: 3.r,
                            color: Colors.black.withValues(alpha: .1),
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              project.title,
                              style: GoogleFonts.inter(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Gap(5.w),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/gold.png',
                                width: 25.w,
                              ),
                              Text(
                                "- Funded Project",
                                style: GoogleFonts.inter(
                                  fontSize: 18.sp,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Gap(20.w),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30.w,
                                foregroundImage: NetworkImage(
                                  project.domainImage,
                                ),
                              ),
                              Gap(20.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Domain:",
                                      style: GoogleFonts.inter(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      project.domain,
                                      style: GoogleFonts.inter(fontSize: 20.w),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Gap(20.w),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30.w,
                                foregroundImage: NetworkImage(
                                  project.categoryImage,
                                ),
                              ),
                              Gap(20.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Category:",
                                      style: GoogleFonts.inter(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      project.category,
                                      style: GoogleFonts.inter(fontSize: 20.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Gap(20.w),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlocBuilder<SaveCubit, bool>(
                                builder: (context, state) {
                                  return TextButton.icon(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      iconColor:
                                          state ? Colors.red : Colors.black,
                                      splashFactory: NoSplash.splashFactory,
                                    ),
                                    onPressed:
                                        context.read<SaveCubit>().onPressed,
                                    label: Text(
                                      "Save",
                                      style: GoogleFonts.inter(fontSize: 20.sp),
                                    ),

                                    icon: Icon(
                                      state
                                          ? Iconsax.heart
                                          : Iconsax.heart_copy,
                                      size: 25.w,
                                    ),
                                  );
                                },
                              ),
                              TextButton.icon(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  splashFactory: NoSplash.splashFactory,
                                ),
                                onPressed: () {},
                                label: Text(
                                  "Share",
                                  style: GoogleFonts.inter(fontSize: 20.sp),
                                ),
                                icon: Icon(Icons.share_outlined, size: 25.w),
                              ),
                              TextButton.icon(
                                style: TextButton.styleFrom(
                                  backgroundColor: ColorPallete.primaryColor,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                onPressed: () {},
                                label: Text(
                                  "Demo",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                icon: Icon(Icons.arrow_outward),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(35.w),
              CarouselSlider(
                options: CarouselOptions(height: 400.w),
                items: List.generate(project.images.length, (index) {
                  final image = project.images[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0).w,
                    child: GestureDetector(
                      onTap:
                          () => Get.toNamed(
                            '/imageViewer',
                            arguments: {
                              'images': project.images,
                              'index': index,
                            },
                          ),
                      child: Hero(
                        tag: image,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              Gap(35.w),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 30.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .1),
                            blurRadius: 10.r,
                            spreadRadius: 3.r,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Project Overview",
                            style: GoogleFonts.inter(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(15.w),
                          Text(
                            project.overview,
                            style: GoogleFonts.inter(fontSize: 18.w),
                          ),
                          Gap(35.w),
                          Text(
                            "Key Features",
                            style: GoogleFonts.inter(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(15.w),
                          Column(
                            children: List.generate(
                              project.keyFeatures.length,
                              (index) {
                                final feature = project.keyFeatures[index];

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10).w,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "•   ",
                                        style: GoogleFonts.inter(
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          feature,
                                          style: GoogleFonts.inter(
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Gap(30.w),
                          Text(
                            "Technology Stack",
                            style: GoogleFonts.inter(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(15.w),
                          Wrap(
                            children: List.generate(
                              project.technologyStack.length,
                              (index) {
                                final stack = project.technologyStack[index];
                                return Card.filled(
                                  margin: EdgeInsets.all(10.w),
                                  color: ColorPallete.greyChip,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(
                                          horizontal: 15.0,
                                          vertical: 10,
                                        ).w,
                                    child: Text(
                                      stack,
                                      style: GoogleFonts.inter(
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Gap(30.w),
                          Text(
                            "Project Results",
                            style: GoogleFonts.inter(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(15.w),
                          Text(
                            project.results,
                            style: GoogleFonts.inter(fontSize: 18.sp),
                          ),
                          Gap(30.w),
                          Text(
                            "Future Improvements",
                            style: GoogleFonts.inter(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(15.w),
                          Text(
                            project.futureImprovements,
                            style: GoogleFonts.inter(fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(35.w),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 30.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .1),
                            blurRadius: 10.r,
                            spreadRadius: 3.r,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Project Team",
                            style: GoogleFonts.inter(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(5.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(project.team.length, (
                              index,
                            ) {
                              final backGroundColor =
                                  ColorPallete.getRandomColor();
                              final member = project.team[index];
                              return ListTile(
                                horizontalTitleGap: 20.w,
                                titleTextStyle: GoogleFonts.inter(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                subtitleTextStyle: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  color: Colors.blueGrey,
                                ),
                                leading: Container(
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: backGroundColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      member.name.substring(0, 1),
                                      style: GoogleFonts.inter(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: ColorPallete.getTextColor(
                                          backGroundColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(member.name),
                                subtitle: Text(member.role),
                              );
                            }),
                          ),
                          Gap(10.w),
                          Divider(color: ColorPallete.greyColor, thickness: .5),
                          Gap(10.w),
                          Text(
                            "Faculty Advisor",
                            style: GoogleFonts.inter(
                              fontSize: 22.w,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(5.w),
                          Builder(
                            builder: (context) {
                              final backgroundColor =
                                  ColorPallete.getRandomColor();
                              final textColor = ColorPallete.getTextColor(
                                backgroundColor,
                              );
                              final mentor = project.mentor;
                              return ListTile(
                                horizontalTitleGap: 20.w,
                                titleTextStyle: GoogleFonts.inter(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                subtitleTextStyle: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  color: Colors.blueGrey,
                                ),
                                leading: Container(
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: backgroundColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      mentor.name.substring(0, 1),
                                      style: GoogleFonts.inter(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: textColor,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(mentor.name),
                                subtitle: Text(mentor.department),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(30.w),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 30.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .1),
                            blurRadius: 10.r,
                            spreadRadius: 3.r,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Project Resources",
                            style: GoogleFonts.inter(
                              fontSize: 22.w,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(20.w),
                          _buildProjectResource(
                            title: "GitHub Repository",
                            subTitle: "Source code and documentation",
                            svg: SvgIcons.github,
                          ),
                          Gap(15.w),
                          _buildProjectResource(
                            title: "Research Paper",
                            subTitle: "Published in IEEE Conference",
                            svg: SvgIcons.researchPaper,
                          ),
                          Gap(15.w),
                          _buildProjectResource(
                            title: "Presentation Slides",
                            subTitle: "Project overview and results",
                            svg: SvgIcons.ppt,
                          ),
                          Gap(15.w),
                          _buildProjectResource(
                            title: "Demo Video",
                            subTitle: "System in action (5:32)",
                            svg: SvgIcons.demoVideo,
                          ),
                          Gap(15.w),
                          _buildProjectResource(
                            title: "Dataset",
                            subTitle: "Sample training data (2.3GB)",
                            svg: SvgIcons.database,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildProjectResource({
    required String title,
    required String subTitle,
    required String svg,
  }) {
    return Material(
      elevation: .3,
      color: ColorPallete.tileColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: ListTile(
        leading: SvgPicture.asset(svg, width: 25.w),
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: GoogleFonts.inter(fontSize: 16.sp, color: Colors.blueGrey),
        ),
      ),
    );
  }
}
