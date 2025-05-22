import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/core/constants/color_pallete.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Text(
        "Research Hub",
        style: GoogleFonts.pacifico(
          fontSize: 27.w,
          color: ColorPallete.primaryColor,
        ),
      ),
    );
  }
}
