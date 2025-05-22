import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:research_hub/core/constants/color_pallete.dart';
import 'package:research_hub/features/auth/presentation/cubit/hide_text_cubit.dart';
import 'package:research_hub/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:research_hub/features/profile/presentation/widgets/outlined_text_field.dart';
import 'package:research_hub/features/profile/presentation/widgets/profile_button.dart';

class ChangePasswordMobile extends StatefulWidget {
  const ChangePasswordMobile({super.key});

  @override
  State<ChangePasswordMobile> createState() => _ChangePasswordMobileState();
}

class _ChangePasswordMobileState extends State<ChangePasswordMobile> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? image = FirebaseAuth.instance.currentUser!.photoURL;
    final bool isImage = image != null && image.isNotEmpty;
    final String? displayName = FirebaseAuth.instance.currentUser!.displayName;
    final bool isName = displayName != null && displayName.isNotEmpty;

    Future<void> updatePassword() async {
      {
        FocusScope.of(context).unfocus();
        if (formKey.currentState!.validate()) {
          context.read<ProfileBloc>().add(
            UpdatePassword(
              currentPassword: currentPasswordController.text.trim(),
              newPassword: newPasswordController.text.trim(),
              confirmNewPassword: confirmNewPasswordController.text.trim(),
            ),
          );
        } else {
          Get.showSnackbar(
            GetSnackBar(
              message: "Enter all fields!",
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    }

    return Scaffold(
      backgroundColor: ColorPallete.scaffoldColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text("Research Hub"),
        titleTextStyle: GoogleFonts.pacifico(
          color: ColorPallete.primaryColor,
          fontSize: 27.w,
        ),
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is PasswordError) {
            Get.showSnackbar(
              GetSnackBar(
                message: state.errorMessage,
                duration: Duration(seconds: 2),
              ),
            );
          } else if (state is PasswordUpdated) {
            currentPasswordController.clear();
            newPasswordController.clear();
            confirmNewPasswordController.clear();
            Get.showSnackbar(
              GetSnackBar(
                message: "Password Changed Successfully!",
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        child: SingleChildScrollView(
          reverse: true,
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
                        CircleAvatar(
                          radius: 70.w,
                          backgroundColor: ColorPallete.secondaryColor,
                          foregroundImage:
                              isImage
                                  ? CachedNetworkImageProvider(image)
                                  : AssetImage('assets/images/profile.png'),
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
                            color: ColorPallete.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Gap(20.w),
                    Text(
                      isName ? displayName : "User Name",
                      style: GoogleFonts.inter(
                        fontSize: 20.w,
                        fontWeight: FontWeight.w600,
                      ),
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
                child: Form(
                  key: formKey,
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
                      BlocProvider(
                        create: (context) => HideTextCubit(),
                        child: OutlinedTextField(
                          controller: currentPasswordController,
                          isPassword: true,
                        ),
                      ),
                      Gap(25.w),
                      Text(
                        "New Password",
                        style: GoogleFonts.inter(fontSize: 14.w),
                      ),
                      Gap(5.w),
                      BlocProvider(
                        create: (context) => HideTextCubit(),
                        child: OutlinedTextField(
                          controller: newPasswordController,
                          isPassword: true,
                        ),
                      ),
                      Gap(25.w),
                      Text(
                        "Confirm New Password",
                        style: GoogleFonts.inter(fontSize: 14.w),
                      ),
                      Gap(5.w),
                      BlocProvider(
                        create: (context) => HideTextCubit(),
                        child: OutlinedTextField(
                          controller: confirmNewPasswordController,
                          isPassword: true,
                          isDone: true,
                        ),
                      ),
                      Gap(35.w),
                      Row(
                        spacing: 15.w,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ProfileButton(
                              text: "Cancel",
                              onPressed: () => Get.back(),
                              buttonColor: Color.fromRGBO(243, 244, 246, 1),
                              textColor: Colors.black,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: ProfileButton(
                              text: "Update Password",
                              onPressed: updatePassword,
                              buttonColor: ColorPallete.primaryColor,
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
