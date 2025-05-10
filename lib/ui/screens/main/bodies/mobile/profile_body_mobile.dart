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
import 'package:research_hub/repository/cubit/notification_cubit.dart';
import 'package:research_hub/repository/cubit/page_index_cubit.dart';
import 'package:research_hub/ui/components/names%20and%20texts/color_name.dart';

class ProfileBodyMobile extends StatelessWidget {
  const ProfileBodyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> logout() async {
      context.read<AuthBloc>().add(LogoutRequested());
      context.read<PageIndexCubit>().onPressed(0);
    }

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Get.offAllNamed('/login');
        } else if (state is AuthFailure) {
          Get.showSnackbar(GetSnackBar(message: state.message));
        }
      },
      builder:
          (context, authState) => SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
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
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            foregroundImage:
                                authState is Authenticated &&
                                        authState.imageUrl != null
                                    ? CachedNetworkImageProvider(
                                      authState.imageUrl!,
                                    )
                                    : AssetImage("assets/images/profile.png"),
                            radius: 70.w,
                          ),
                          IconButton.filled(
                            style: IconButton.styleFrom(
                              backgroundColor: ColorName.primaryColor,
                            ),
                            onPressed: () {},
                            icon: Icon(Iconsax.camera_copy),
                          ),
                        ],
                      ),
                      Gap(20.h),
                      Text(
                        authState is Authenticated &&
                                authState.displayName != null
                            ? "${authState.displayName}"
                            : "User Name",
                        style: GoogleFonts.inter(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(5.h),
                      Text(
                        "${FirebaseAuth.instance.currentUser?.email}",
                        style: GoogleFonts.inter(fontSize: 18.sp),
                      ),
                    ],
                  ),
                ),
                Gap(30.h),
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
                      Gap(20.h),
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
                      Gap(15.h),
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
                Gap(30.h),
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
                            "Account Settings",
                            style: GoogleFonts.inter(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                      Gap(20.h),
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
                              activeTrackColor: ColorName.primaryColor,
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
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                      Gap(15.h),
                      ListTile(
                        leading: Icon(Icons.lock_outline),
                        title: Text("Language"),
                        subtitle: Text("Select your preferred language"),
                        titleTextStyle: GoogleFonts.inter(
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                        trailing: Icon(Iconsax.arrow_right_3_copy),
                      ),
                    ],
                  ),
                ),
                Gap(30.h),
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
          ),
    );
  }
}
