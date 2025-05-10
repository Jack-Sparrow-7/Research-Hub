import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/ui/components/buttons/get_started_button.dart';
import 'package:research_hub/ui/components/names%20and%20texts/image_name.dart';
import 'package:research_hub/ui/components/names%20and%20texts/text_lines.dart';

class GetStartedDesktop extends StatelessWidget {
  const GetStartedDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          width: 1728.w,
          height: 1117.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageName.gsDesktop),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(50.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TextLines.getStartedText1,
                          style: GoogleFonts.poppins(
                            fontSize: 64.r,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Gap(20.r),
                        Text(
                          TextLines.getStartedText2,
                          style: GoogleFonts.poppins(
                            fontSize: 36.r,
                            color: Colors.white,
                          ),
                        ),
                        Gap(50.r),
                        GetStartedButton(page: '/login'),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(child: Image.asset(ImageName.technology)),
            ],
          ),
        ),
      ),
    );
  }
}
