import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/core/constants/color_pallete.dart';

class FilledOutlinedDropDown extends StatelessWidget {
  const FilledOutlinedDropDown({
    super.key,
    required this.list,
    required this.hintText,
  });

  final List list;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown(
      name: hintText,
      hint: Text(hintText),
      borderRadius: BorderRadius.circular(10.r),
      dropdownColor: Colors.white,
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          return null;
        }
        return "This field is required";
      },
      menuMaxHeight: 200.w,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          color: const Color.fromRGBO(156, 163, 175, 1),
        ),
        suffixIconColor: Color.fromRGBO(156, 163, 175, 1),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Color.fromRGBO(209, 213, 219, 1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: ColorPallete.primaryColor),
        ),
      ),
      items: List.generate(list.length, (index) {
        final value = list[index].title;
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }),
      onChanged: (value) {
        // Do something with the selected value
        debugPrint("Selected: $value");
      },
    );
  }
}
