import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/core/constants/color_pallete.dart';
import 'package:research_hub/features/explore/domain/entities/category_entity.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  Card subCategoryText(String text) {
    return Card.filled(
      color: ColorPallete.primaryChip,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
      child: Padding(
        padding: const EdgeInsets.all(8.0).w,
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            color: ColorPallete.primaryColor,
          ),
        ),
      ),
    );
  }

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/category', arguments: {'category': category}),
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
                alignment: Alignment.center,
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
                      imageUrl: category.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SizedBox.shrink(),
                    ),
                  ),
                ),
              ),
              Gap(15.w),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.title,
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "(${category.count} Projects)",
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        color: Color.fromRGBO(107, 114, 128, 1),
                      ),
                    ),
                    Gap(15.w),
                    Row(
                      spacing: 10.w,
                      children: [
                        subCategoryText(category.sub_1),
                        subCategoryText(category.sub_2),
                      ],
                    ),
                    Gap(15.w),
                    Row(
                      children: [
                        Image.asset('assets/images/gold.png', width: 25.w),
                        Text(
                          "${category.funded} - Funded Projects",
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
    );
  }
}
