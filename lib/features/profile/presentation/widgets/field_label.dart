
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FieldLabel extends StatelessWidget {
  const FieldLabel({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(
        TextSpan(
          text: (text),
          style: GoogleFonts.inter(fontSize: 16.w, color: Colors.black),
          children: [
            TextSpan(
              text: "*",
              style: GoogleFonts.inter(fontSize: 16.w, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}