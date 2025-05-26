import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/core/constants/color_pallete.dart';
import 'package:research_hub/features/auth/presentation/bloc/forgot_password_bloc.dart';
import 'package:research_hub/features/auth/presentation/cubit/hide_text_cubit.dart';
import 'package:research_hub/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:research_hub/features/auth/presentation/widgets/auth_button.dart';
import 'package:research_hub/features/auth/presentation/widgets/auth_field.dart';

class ForgotPasswordMobile extends StatefulWidget {
  const ForgotPasswordMobile({super.key});

  @override
  State<ForgotPasswordMobile> createState() => _ForgotPasswordMobileState();
}

class _ForgotPasswordMobileState extends State<ForgotPasswordMobile> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.scaffoldColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.w),
        child: AuthAppBar(),
      ),
      body: Center(
        child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordError) {
              Get.showSnackbar(
                GetSnackBar(
                  message: state.errorMessage,
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ForgotPasswordLoading) {
              return CircularProgressIndicator();
            } else if (state is ForgotPasswordLoaded) {
              return Container(
                padding: EdgeInsets.all(25.r),
                height: 300.w,
                width: 400.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Reset Password",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                      ),
                    ),
                    Text(
                      "Reset Password link was sent to email - ${emailController.text.trim()}",
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPallete.primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 20.w,
                          horizontal: 30.w,
                        ),
                      ),
                      onPressed: () {
                        Get.offAllNamed('/login');
                      },
                      child: Text(
                        "Ok",
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  Container(
                    width: 400.w,
                    padding: EdgeInsets.symmetric(
                      vertical: 30.w,
                      horizontal: 30.w,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10.r,
                          spreadRadius: 3.r,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17.r),
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reset Password",
                            style: GoogleFonts.inter(
                              fontSize: 26.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Gap(12.w),
                          Text(
                            "Enter your email address and we'll send you a link to reset your password.",
                            style: GoogleFonts.inter(fontSize: 16.sp),
                          ),
                          Gap(30.w),
                          Text(
                            "Email Address",
                            style: GoogleFonts.inter(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(5.w),
                          Align(
                            alignment: Alignment.center,
                            child: BlocProvider(
                              create: (context) => HideTextCubit(),
                              child: AuthField(
                                controller: emailController,
                                icon: Icon(Icons.email_outlined),
                                text: "Enter your email address",
                                missingText: "Email",
                                isDone: true,
                              ),
                            ),
                          ),
                          Gap(25.w),
                          Align(
                            alignment: Alignment.center,
                            child: AuthButton(
                              text: "Send Reset Link",
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                if (formKey.currentState!.validate()) {
                                  context.read<ForgotPasswordBloc>().add(
                                    ResetPasswordEvent(
                                      email: emailController.text.trim(),
                                    ),
                                  );
                                } else {
                                  Get.showSnackbar(
                                    GetSnackBar(
                                      message: "Enter the email!",
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          Gap(25.w),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "We'll email you a password reset link.",
                              style: GoogleFonts.inter(fontSize: 15.sp),
                            ),
                          ),
                          Gap(30.w),
                          Align(
                            alignment: Alignment.center,
                            child: TextButton.icon(
                              onPressed: () => Get.back(),
                              icon: Icon(
                                Icons.arrow_back,
                                color: ColorPallete.primaryColor,
                              ),
                              label: Text(
                                "Back to login",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp,
                                  color: ColorPallete.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
