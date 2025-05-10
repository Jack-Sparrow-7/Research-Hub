import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/ui/components/buttons/primary_button.dart';
import 'package:research_hub/ui/components/names%20and%20texts/color_name.dart';
import 'package:research_hub/ui/components/text_fields/outlined_text_field.dart';

class ForgotPasswordMobile extends StatefulWidget {
  const ForgotPasswordMobile({super.key});

  @override
  State<ForgotPasswordMobile> createState() => _ForgotPasswordMobileState();
}

class _ForgotPasswordMobileState extends State<ForgotPasswordMobile> {
  TextEditingController emailController = TextEditingController();

  Future<void> sendPasswordResetEmail() async {
    FocusScope.of(context).unfocus();
    String email = emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email is required!"), showCloseIcon: true),
      );
    } else {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        showDialog(
          context: context,
          builder:
              (context) => Dialog(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.all(25.r),
                  height: 300.r,
                  width: 400.r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Reset Password",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.r,
                        ),
                      ),
                      Text(
                        "Reset Password link was sent to email - $email",
                        style: GoogleFonts.poppins(
                          fontSize: 20.r,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        color: ColorName.primaryColor,
                        textColor: Colors.white,
                        onPressed: () => Get.offAllNamed('/login'),
                        child: Text(
                          "Ok",
                          style: GoogleFonts.poppins(
                            fontSize: 18.r,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        );
      } on FirebaseAuthException catch (e) {
        String message;
        if (e.code == 'invalid-email') {
          message = "User not found for that email!";
        } else {
          message = "Error occurred, Please try again!";
        }
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message), showCloseIcon: true));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error occurred. Please try again!"),
            showCloseIcon: true,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.scaffoldColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Research Hub",
          style: GoogleFonts.pacifico(
            fontSize: 27.w,
            color: ColorName.primaryColor,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(20.r),
            reverse: true,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10.r,
                        spreadRadius: 3.r,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SizedBox(
                      // height: 370.h,
                      width: 324.w,
                      child: Form(
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
                            Gap(12.h),
                            Text(
                              "Enter your email address and we'll send you a link to reset your password.",
                              style: GoogleFonts.inter(fontSize: 16.sp),
                            ),
                            Gap(30.h),
                            Text(
                              "Email Address",
                              style: GoogleFonts.inter(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Gap(5.h),
                            Align(
                              alignment: Alignment.center,
                              child: OutlinedTextField(
                                controller: emailController,
                                icon: Icon(Icons.email_outlined),
                                text: "Enter your email address",
                                isDone: true,
                              ),
                            ),
                            Gap(25.h),
                            Align(
                              alignment: Alignment.center,
                              child: PrimaryButton(
                                textColor: Colors.white,
                                buttonColor: ColorName.primaryColor,
                                width: 324.w,
                                text: "Send Reset Link",
                                onPressed: sendPasswordResetEmail,
                              ),
                            ),
                            Gap(25.h),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "We'll email you a password reset link.",
                                style: GoogleFonts.inter(fontSize: 15.sp),
                              ),
                            ),
                            Gap(30.h),
                            Align(
                              alignment: Alignment.center,
                              child: TextButton.icon(
                                onPressed: () => Get.back(),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: ColorName.primaryColor,
                                ),
                                label: Text(
                                  "Back to login",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp,
                                    color: ColorName.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
