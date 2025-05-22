import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/core/constants/color_pallete.dart';
import 'package:research_hub/main%20screen/cubit/page_index_cubit.dart';

class FavoritesBodyMobile extends StatelessWidget {
  const FavoritesBodyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.w),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "My Favorites",
              style: GoogleFonts.inter(
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Gap(10.w),
          Text(
            "Your collection of saved projects. View, organize, and manage all your favorite student projects in one place.",
            style: GoogleFonts.inter(fontSize: 18.sp),
          ),
          Gap(20.w),
          TextButton.icon(
            style: TextButton.styleFrom(
              fixedSize: Size.fromWidth(400.w),
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20.w),
              side: BorderSide(color: ColorPallete.fieldBorder),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            iconAlignment: IconAlignment.start,
            onPressed: () => context.read<PageIndexCubit>().onPressed(1),
            icon: Icon(Icons.explore_outlined, color: Colors.black),
            label: Text(
              "Explore More Projects",
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Gap(35.w),
        ],
      ),
    );
  }
}
