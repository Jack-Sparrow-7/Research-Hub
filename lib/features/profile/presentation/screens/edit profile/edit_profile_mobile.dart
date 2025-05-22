import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/core/constants/color_pallete.dart';
import 'package:research_hub/features/profile/presentation/widgets/field_label.dart';
import 'package:research_hub/features/profile/presentation/widgets/filled_outlined_field.dart';
import 'package:research_hub/features/profile/presentation/widgets/profile_button.dart';

class EditProfileMobile extends StatefulWidget {
  const EditProfileMobile({super.key});

  @override
  State<EditProfileMobile> createState() => _EditProfileMobileState();
}

class _EditProfileMobileState extends State<EditProfileMobile> {
  @override
  Widget build(BuildContext context) {
    final String? image = FirebaseAuth.instance.currentUser!.photoURL;
    final bool isImage = image != null && image.isNotEmpty;
    final String? displayName = FirebaseAuth.instance.currentUser!.displayName;
    final bool isName = displayName != null && displayName.isNotEmpty;
    return Scaffold(
      backgroundColor: ColorPallete.scaffoldColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text("Research Hub"),
        titleTextStyle: GoogleFonts.pacifico(
          fontSize: 24.w,
          fontWeight: FontWeight.w500,
          color: ColorPallete.primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 70.w),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: ColorPallete.secondaryColor,
                    radius: 70.w,
                    foregroundImage:
                        isImage
                            ? CachedNetworkImageProvider(image)
                            : AssetImage("assets/images/profile.png"),
                  ),
                  Gap(20.w),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Change Photo",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        color: ColorPallete.primaryColor,
                      ),
                    ),
                  ),
                  Gap(50.w),
                  FieldLabel(text: "Full Name"),
                  Gap(5.w),
                  FilledOutlinedField(
                    initalValue: isName ? displayName : "User Name",
                    text: "Enter your name",
                  ),
                  Gap(50.w),
                  FieldLabel(text: "Email Address"),
                  Gap(5.w),
                  FilledOutlinedField(
                    isDone: true,
                    initalValue: FirebaseAuth.instance.currentUser!.email!,
                    text: "Enter your email",
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.w),
              child: Column(
                children: [
                  ProfileButton(
                    width: 380.w,
                    textColor: Colors.white,
                    buttonColor: ColorPallete.primaryColor,
                    text: "Save Changes",
                    onPressed: () {},
                  ),
                  Gap(20.w),
                  ProfileButton(
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
