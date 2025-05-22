import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/core/constants/color_pallete.dart';
import 'package:research_hub/features/home/domain/entities/domain_entitiy.dart';

class DomainCard extends StatelessWidget {
  const DomainCard({super.key, required this.domain});

  final DomainEntitiy domain;

  Card subDomainText(String text) {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/domain', arguments: {'domain': domain}),
      child: Container(
        padding: EdgeInsets.all(20.r),
        width: 404.w,
        margin: EdgeInsets.only(bottom: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
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
                  width: 368.w,
                  // height: 220.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.grey.shade300,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: CachedNetworkImage(
                      imageUrl: domain.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SizedBox.shrink(),
                    ),
                  ),
                ),
              ),
              Gap(15.w),
              Text(
                domain.title,
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "(${domain.projectsCount} Projects)",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  color: Color.fromRGBO(107, 114, 128, 1),
                ),
              ),
              Gap(15.w),
              Row(
                spacing: 10.w,
                children: [
                  subDomainText(domain.sub_1),
                  subDomainText(domain.sub_2),
                ],
              ),
              Gap(15.w),
              Row(
                children: [
                  Image.asset('assets/images/gold.png', width: 25.w),
                  Text(
                    "${domain.fundedProjectsCount} - Funded Projects",
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
      ),
    );
  }
}
