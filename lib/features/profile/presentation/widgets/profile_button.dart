import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.padding = 20,
    this.width = double.infinity,
    required this.buttonColor,
    required this.textColor,
  });

  final String text;
  final VoidCallback onPressed;
  final double padding;
  final Color buttonColor;
  final Color textColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: .5,
        backgroundColor: buttonColor,
        foregroundColor: textColor,
        padding: EdgeInsets.symmetric(vertical: padding.w),
        fixedSize: Size.fromWidth(width),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.inter(fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
    );
  }
}
