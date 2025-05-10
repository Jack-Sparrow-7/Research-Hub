import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/model/domain_model.dart';
import 'package:research_hub/ui/components/names%20and%20texts/color_name.dart';

class DomainCard extends StatelessWidget {
  const DomainCard({super.key, required this.domain});

  final DomainModel domain;

  Chip subDomainText(String text) {
    return Chip(
      labelPadding: EdgeInsets.all(2.r),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
      label: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 16.sp,
          color: ColorName.primaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      width: 404.w,
      margin: EdgeInsets.only(bottom: 20.h),
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
            Gap(15.h),
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
            Gap(15.h),
            Row(
              spacing: 10.w,
              children: [
                subDomainText(domain.sub_1),
                subDomainText(domain.sub_2),
              ],
            ),
            Gap(15.h),
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
    );
  }
}
