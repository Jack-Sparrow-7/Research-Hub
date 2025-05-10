import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/responsive/device_info_service.dart';
import 'package:research_hub/ui/components/names%20and%20texts/color_name.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key, required this.page});

  final String page;

  @override
  Widget build(BuildContext context) {
    final isDesktop = DeviceInfoService.isDesktop;
    // final buttonPadding =
    //     isDesktop
    //         ? EdgeInsets.symmetric(vertical: 30.r)
    //         : EdgeInsets.symmetric(vertical: 18.w);
    final buttonTextSize = isDesktop ? 20.sp : 18.sp;

    return ElevatedButton(
      onPressed: () => Get.toNamed(page),
      style: ElevatedButton.styleFrom(
        backgroundColor: isDesktop ? Colors.white : ColorName.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),

        fixedSize: Size(isDesktop ? 400.w : 300.w, isDesktop ? 70.w : 55.w),
        // padding: buttonPadding,
        foregroundColor: isDesktop ? Colors.black : Colors.white,
      ),
      child: Text(
        "Get Started",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: buttonTextSize,
        ),
      ),
    );
  }
}
