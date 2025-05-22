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
import 'package:research_hub/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:research_hub/features/profile/presentation/cubit/notification_cubit.dart';
import 'package:research_hub/main%20screen/cubit/page_index_cubit.dart';

class ProfileBodyMobile extends StatelessWidget {
  const ProfileBodyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> logout() async {
      context.read<ProfileBloc>().add(LogoutRequested());
    }

    final String? image = FirebaseAuth.instance.currentUser!.photoURL;
    final bool isImage = image != null && image.isNotEmpty;
    final String? userName = FirebaseAuth.instance.currentUser!.displayName;
    final bool isName = userName != null && userName.isNotEmpty;
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoggedOut) {
          Get.offAllNamed('/login');
          context.read<PageIndexCubit>().onPressed(0);
        } else if (state is ProfileError) {
          Get.showSnackbar(
            GetSnackBar(
              message: state.errorMessage,
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 20.w),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 50.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10.r,
                      spreadRadius: 3.r,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      foregroundImage:
                          isImage
                              ? CachedNetworkImageProvider(image)
                              : AssetImage("assets/images/profile.png"),
                      radius: 70.w,
                    ),
                    Gap(20.w),
                    Text(
                      isName ? userName : "User Name",
                      style: GoogleFonts.inter(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(5.w),
                    Text(
                      "${FirebaseAuth.instance.currentUser?.email}",
                      style: GoogleFonts.inter(fontSize: 18.sp),
                    ),
                  ],
                ),
              ),
              Gap(30.w),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10.r,
                      spreadRadius: 3.r,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Quick Actions",
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    Gap(20.w),
                    ListTile(
                      onTap: () => Get.toNamed('/editProfile'),
                      leading: Icon(Iconsax.edit_2_copy),
                      title: Text("Edit Profile"),
                      titleTextStyle: GoogleFonts.inter(
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                      trailing: Icon(Iconsax.arrow_right_3_copy),
                    ),
                    Gap(15.w),
                    ListTile(
                      onTap: () => Get.toNamed('/changePassword'),
                      leading: Icon(Icons.lock_outline),
                      title: Text("Change Password"),
                      titleTextStyle: GoogleFonts.inter(
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                      trailing: Icon(Iconsax.arrow_right_3_copy),
                    ),
                  ],
                ),
              ),
              Gap(30.w),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10.r,
                      spreadRadius: 3.r,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Account Settings",
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    Gap(20.w),
                    ListTile(
                      leading: Icon(Iconsax.notification_copy),
                      trailing: BlocBuilder<NotificationCubit, bool>(
                        builder: (context, state) {
                          return Switch(
                            value: state,
                            onChanged: (value) {
                              context.read<NotificationCubit>().onPressed(
                                value,
                              );
                            },
                            activeColor: Colors.white,
                            activeTrackColor: ColorPallete.primaryColor,
                          );
                        },
                      ),
                      title: Text("Notifications"),
                      titleTextStyle: GoogleFonts.inter(
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                      subtitle: Text("Manage notification preferences"),
                      subtitleTextStyle: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                    Gap(15.w),
                    ListTile(
                      leading: Icon(Icons.lock_outline),
                      title: Text("Language"),
                      subtitle: Text("Select your preferred language"),
                      subtitleTextStyle: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                      titleTextStyle: GoogleFonts.inter(
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                      trailing: Icon(Iconsax.arrow_right_3_copy),
                    ),
                  ],
                ),
              ),
              Gap(30.w),
              TextButton.icon(
                style: TextButton.styleFrom(
                  textStyle: GoogleFonts.inter(fontSize: 18.sp),
                  padding: EdgeInsets.symmetric(vertical: 18.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  fixedSize: Size.fromWidth(400.w),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: logout,
                label: Text("Log Out"),
                icon: Icon(Iconsax.logout_copy),
              ),
            ],
          ),
        );
      },
    );
  }
}
