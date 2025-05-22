import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:research_hub/core/constants/color_pallete.dart';
import 'package:research_hub/features/projects/domain/entities/project_entity.dart';
import 'package:research_hub/features/projects/presentation/cubit/save_cubit.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
    this.domain,
    this.subDomain1,
    this.subDomain2,
    this.domainImage,
    this.category,
    this.subCategory1,
    this.subCategory2,
    this.categoryImage,
  });

  Card subCategoryText(String text) {
    return Card.filled(
      color: ColorPallete.greyChip,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
      child: Padding(
        padding: const EdgeInsets.all(8.0).w,
        child: Text(
          text,
          style: GoogleFonts.inter(fontSize: 16.sp, color: Colors.black),
        ),
      ),
    );
  }

  final ProjectEntity project;
  final String? domain;
  final String? subDomain1;
  final String? subDomain2;
  final String? domainImage;
  final String? category;
  final String? subCategory1;
  final String? subCategory2;
  final String? categoryImage;
  String title() {
    if (domain != null) {
      return domain!;
    } else {
      return category!;
    }
  }

  String sub1() {
    if (subDomain1 != null) {
      return subDomain1!;
    } else {
      return subCategory1!;
    }
  }

  String sub2() {
    if (subDomain2 != null) {
      return subDomain2!;
    } else {
      return subCategory2!;
    }
  }

  String image() {
    if (domainImage != null) {
      return domainImage!;
    } else {
      return categoryImage!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SaveCubit(),
      child: GestureDetector(
        onTap: () => Get.toNamed('/project', arguments: {'project': project,}),
        child: Container(
          padding: EdgeInsets.only(bottom: 20.w),
          width: 400.w,
          margin: EdgeInsets.only(bottom: 30.w),
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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: Container(
                    width: 400.w,
                    // height: 220.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                      color: Colors.grey.shade300,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: project.image,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => SizedBox.shrink(),
                      ),
                    ),
                  ),
                ),
                Gap(25.w),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            project.title,
                            style: GoogleFonts.inter(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          BlocBuilder<SaveCubit, bool>(
                            builder: (context, state) {
                              return TextButton.icon(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  iconColor: state ? Colors.red : Colors.black,
                                  splashFactory: NoSplash.splashFactory,
                                ),
                                onPressed: context.read<SaveCubit>().onPressed,
                                label: Text(
                                  "Save",
                                  style: GoogleFonts.inter(fontSize: 20.sp),
                                ),

                                icon: Icon(
                                  state ? Iconsax.heart : Iconsax.heart_copy,
                                  size: 25.w,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Gap(10.w),
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        project.overview,
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          color: Color.fromRGBO(107, 114, 128, 1),
                        ),
                      ),
                      Gap(15.w),
                      Wrap(
                        children: [
                          subCategoryText(title()),
                          subCategoryText(sub1()),
                          subCategoryText(sub2()),
                        ],
                      ),
                      Gap(15.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/gold.png', width: 25.w),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
