import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/ui/components/buttons/get_started_button.dart';
import 'package:research_hub/ui/components/names%20and%20texts/image_name.dart';
import 'package:research_hub/ui/components/names%20and%20texts/text_lines.dart';
import 'package:gap/gap.dart';

class GetStartedMobile extends StatelessWidget {
  const GetStartedMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageName.gsMobile),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // const Gap(40),
            Expanded(
              child: Center(
                child: Image.asset(
                  ImageName.technology,
                  fit: BoxFit.contain,
                  width: 400.w,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50.r),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    TextLines.getStartedText1,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(12.h),
                  Text(
                    TextLines.getStartedText2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 16.sp),
                  ),
                  Gap(24.h),
                  GetStartedButton(page: '/login'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
