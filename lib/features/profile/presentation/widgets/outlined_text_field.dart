import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:research_hub/core/constants/color_pallete.dart';
import 'package:research_hub/features/auth/presentation/cubit/hide_text_cubit.dart';

class OutlinedTextField extends StatelessWidget {
  const OutlinedTextField({
    super.key,
    required this.controller,
    this.icon,
    this.text,
    this.isPassword = false,
    this.isDone = false,
  });

  final TextEditingController controller;
  final Icon? icon;
  final String? text;
  final bool isPassword;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border({required Color color}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: color),
      );
    }

    return BlocBuilder<HideTextCubit, bool>(
      builder: (context, state) {
        return TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "This field is Required!";
            }
            return null;
          },
          keyboardType: isPassword ? null : TextInputType.emailAddress,
          autofillHints:
              isPassword ? [AutofillHints.password] : [AutofillHints.username],
          textInputAction: isDone ? TextInputAction.done : TextInputAction.next,
          controller: controller,
          obscureText: isPassword && state,
          style: GoogleFonts.inter(fontSize: 16.sp),
          decoration: InputDecoration(
            // constraints: BoxConstraints.loose(Size(324.w, 55.w)),
            suffixIcon:
                isPassword
                    ? GestureDetector(
                      onTap: () => context.read<HideTextCubit>().onPressed(),
                      child: Icon(
                        state ? Iconsax.eye_copy : Iconsax.eye_slash_copy,
                      ),
                    )
                    : null,
            suffixIconColor: Color.fromRGBO(156, 163, 175, 1),
            prefixIcon: icon,
            prefixIconColor: const Color.fromRGBO(156, 163, 175, 1),
            hintText: text,
            hintStyle: GoogleFonts.inter(
              fontSize: 16.sp,
              color: const Color.fromRGBO(156, 163, 175, 1),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 18.w,
              horizontal: 12.w,
            ),
            focusedBorder: border(color: ColorPallete.primaryColor),
            enabledBorder: border(color: ColorPallete.fieldBorder),
            errorBorder: border(color: ColorPallete.redColor),
            focusedErrorBorder: border(color: ColorPallete.redColor),
          ),
        );
      },
    );
  }
}
