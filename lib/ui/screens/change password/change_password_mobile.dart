import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:research_hub/repository/authentication/bloc/auth_bloc.dart';
import 'package:research_hub/ui/components/buttons/primary_button.dart';
import 'package:research_hub/ui/components/names%20and%20texts/color_name.dart';
import 'package:research_hub/ui/components/names%20and%20texts/image_name.dart';
import 'package:research_hub/ui/components/text_fields/outlined_text_field.dart';

class ChangePasswordMobile extends StatefulWidget {
  const ChangePasswordMobile({super.key});

  @override
  State<ChangePasswordMobile> createState() => _ChangePasswordMobileState();
}

class _ChangePasswordMobileState extends State<ChangePasswordMobile> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  Future<void> updatePassword() async {
    FocusScope.of(context).unfocus();
    final String currentPassword = currentPasswordController.text.trim();
    final String newPassword = newPasswordController.text.trim();
    final String confirmNewPassword = confirmNewPasswordController.text.trim();
    final firebaseAuth = FirebaseAuth.instance;
    final user = firebaseAuth.currentUser;

    if (currentPassword.isEmpty ||
        newPassword.isEmpty ||
        confirmNewPassword.isEmpty) {
      Get.showSnackbar(
        GetSnackBar(
          message: "All fields are required!",
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    if (newPassword != confirmNewPassword) {
      Get.showSnackbar(
        GetSnackBar(
          message: "New Password and Confirm New Password should be the same.",
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    try {
      final credential = EmailAuthProvider.credential(
        email: user!.email!,
        password: currentPassword,
      );

      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);

      Get.showSnackbar(
        GetSnackBar(
          message: "Password updated successfully.",
          duration: Duration(seconds: 3),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        Get.showSnackbar(
          GetSnackBar(
            message: "Current password is incorrect.",
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(
            message: "Something went wrong",
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: "An unexpected error occurred.",
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.scaffoldColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Research Hub"),
        titleTextStyle: GoogleFonts.pacifico(
          color: ColorName.primaryColor,
          fontSize: 27.w,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 400.w,
              padding: EdgeInsets.symmetric(vertical: 40.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .1),
                    blurRadius: 10.r,
                    spreadRadius: 3.r,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          final isImage =
                              state is Authenticated && state.imageUrl != null;
                          return CircleAvatar(
                            radius: 70.w,
                            backgroundColor: ColorName.secondaryColor,
                            foregroundImage:
                                isImage
                                    ? CachedNetworkImageProvider(
                                      state.imageUrl!,
                                    )
                                    : AssetImage(ImageName.profile),
                          );
                        },
                      ),
                      Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.w),
                        ),
                        child: Icon(
                          Iconsax.tick_circle,
                          size: 50.w,
                          color: ColorName.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Gap(20.w),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final isName =
                          state is Authenticated && state.displayName != null;
                      return Text(
                        isName ? "${state.displayName}" : "User Name",
                        style: GoogleFonts.inter(
                          fontSize: 20.w,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                  Gap(5.w),
                  Text(
                    "${FirebaseAuth.instance.currentUser?.email!}",
                    style: GoogleFonts.inter(fontSize: 16.w),
                  ),
                ],
              ),
            ),
            Gap(25.w),
            Container(
              width: 400.w,
              padding: EdgeInsets.all(25.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .1),
                    blurRadius: 10.r,
                    spreadRadius: 3.r,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Change Password",
                    style: GoogleFonts.inter(fontSize: 18.w),
                  ),
                  Gap(25.w),
                  Text(
                    "Current Password",
                    style: GoogleFonts.inter(fontSize: 14.w),
                  ),
                  Gap(5.w),
                  OutlinedTextField(
                    controller: currentPasswordController,
                    isPassword: true,
                  ),
                  Gap(25.w),
                  Text(
                    "New Password",
                    style: GoogleFonts.inter(fontSize: 14.w),
                  ),
                  Gap(5.w),
                  OutlinedTextField(
                    controller: newPasswordController,
                    isPassword: true,
                  ),
                  Gap(25.w),
                  Text(
                    "Confirm New Password",
                    style: GoogleFonts.inter(fontSize: 14.w),
                  ),
                  Gap(5.w),
                  OutlinedTextField(
                    controller: confirmNewPasswordController,
                    isPassword: true,
                    isDone: true,
                  ),
                  Gap(35.w),
                  Row(
                    spacing: 15.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          elevation: 0.5,
                          width: double.infinity,
                          text: "Cancel",
                          onPressed: () => Get.back(),
                          buttonColor: Color.fromRGBO(243, 244, 246, 1),
                          textColor: Colors.black,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: PrimaryButton(
                          elevation: 0.5,
                          width: double.infinity,
                          text: "Update Password",
                          onPressed: updatePassword,
                          buttonColor: ColorName.primaryColor,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
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
