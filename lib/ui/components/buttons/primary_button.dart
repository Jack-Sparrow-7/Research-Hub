import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.width,
    required this.text,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
    this.elevation,
    this.padding = 18,
  });

  final double? width;
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final double? elevation;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      color: buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      padding: EdgeInsets.symmetric(vertical: padding.w),
      minWidth: width,
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 16.w,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
