import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/repository/authentication/bloc/auth_bloc.dart';
import 'package:research_hub/ui/components/buttons/primary_button.dart';
import 'package:research_hub/ui/components/names%20and%20texts/color_name.dart';

class EditProfileMobile extends StatelessWidget {
  const EditProfileMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.scaffoldColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Research Hub"),
        titleTextStyle: GoogleFonts.pacifico(
          fontSize: 24.w,
          fontWeight: FontWeight.w500,
          color: ColorName.primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, authState) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 70.w),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorName.secondaryColor,
                        radius: 70.w,
                        foregroundImage:
                            authState is Authenticated &&
                                    authState.imageUrl != null
                                ? CachedNetworkImageProvider(
                                  authState.imageUrl!,
                                )
                                : AssetImage("assets/images/profile.png"),
                      ),
                      Gap(20.w),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Change Photo",
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            color: ColorName.primaryColor,
                          ),
                        ),
                      ),
                      Gap(50.w),
                      FieldLabel(text: "Full Name"),
                      Gap(5.w),
                      FilledOutlinedField(
                        initalValue:
                            authState is Authenticated &&
                                    authState.user.displayName != null
                                ? authState.displayName!
                                : "User Name",
                        text: "Enter your name",
                      ),
                      Gap(50.w),
                      FieldLabel(text: "Email Address"),
                      Gap(5.w),
                      FilledOutlinedField(
                        initalValue: FirebaseAuth.instance.currentUser!.email!,
                        text: "Enter your email",
                      ),
                    ],
                  ),
                );
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.w),
              child: Column(
                children: [
                  PrimaryButton(
                    elevation: .5,
                    textColor: Colors.white,
                    buttonColor: ColorName.primaryColor,
                    width: 380.w,
                    text: "Save Changes",
                    onPressed: () {},
                  ),
                  Gap(20.w),
                  PrimaryButton(
                    elevation: .5,
                    width: 380.w,
                    text: "Cancel",
                    onPressed: () => Get.back(),
                    buttonColor: Colors.white,
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class FilledOutlinedField extends StatelessWidget {
  const FilledOutlinedField({
    super.key,
    required this.initalValue,
    required this.text,
  });

  final String initalValue;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initalValue,
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
          borderSide: BorderSide(color: ColorName.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Color.fromRGBO(209, 213, 219, 1)),
        ),
      ),
    );
  }
}
