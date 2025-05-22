import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/core/constants/color_pallete.dart';

class FilledOutlinedField extends StatelessWidget {
  const FilledOutlinedField({
    super.key,
    required this.initalValue,
    required this.text,this.isDone =false,
  });

  final String initalValue;
  final String text;
  final bool isDone;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null) {
          return "This field is required!";
        }
        return null;
      },
      initialValue: initalValue,
      textInputAction: isDone?TextInputAction.done:TextInputAction.next,
      decoration: InputDecoration(
        // constraints: BoxConstraints.loose(Size(380.w, 55.w)),
        contentPadding: EdgeInsets.symmetric(vertical: 18.w, horizontal: 15.w),
        fillColor: Colors.white,
        filled: true,
        suffixIconColor: Color.fromRGBO(156, 163, 175, 1),
        hintText: text,
        hintStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          color: const Color.fromRGBO(156, 163, 175, 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: ColorPallete.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Color.fromRGBO(209, 213, 219, 1)),
        ),
      ),
    );
  }
}
