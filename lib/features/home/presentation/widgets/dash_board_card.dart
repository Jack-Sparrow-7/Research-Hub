import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardCard extends StatelessWidget {
  const DashBoardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.r),
      width: 404.w,
      // height: 115.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
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
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 30.r),
          horizontalTitleGap: 20.w,
          tileColor: Colors.white,
          minLeadingWidth: 55.w,
          leading: CachedNetworkImage(
            width: 60.r,
            imageUrl: image,
            errorWidget:
                (context, url, error) => Container(
                  width: 60.r,
                  height: 60.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.grey.shade300,
                  ),
                ),
            placeholder:
                (context, url) => Center(
                  child: Container(
                    width: 60.r,
                    height: 60.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          title: Text(title),
          titleTextStyle: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          subtitle: Text(subtitle),
          subtitleTextStyle: GoogleFonts.inter(
            fontSize: 27.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
