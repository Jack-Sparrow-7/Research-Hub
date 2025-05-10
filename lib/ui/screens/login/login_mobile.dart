import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:research_hub/repository/authentication/bloc/auth_bloc.dart';
import 'package:research_hub/ui/components/buttons/primary_button.dart';
import 'package:research_hub/ui/components/names%20and%20texts/color_name.dart';
import 'package:research_hub/ui/components/text_fields/outlined_text_field.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    FocusScope.of(context).unfocus();
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Enter all fields!"), showCloseIcon: true),
      );
    } else {
      final authBloc = context.read<AuthBloc>();
      authBloc.add(LoginRequested(email: email, password: password));
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
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            CircularProgressIndicator(color: ColorName.primaryColor);
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), showCloseIcon: true),
            );
          } else if (state is Authenticated) {
            Get.offAllNamed('/main');
          }
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(20.w),
              reverse: true,
              child: Column(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 30.w),
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
                    child: Center(
                      child: SizedBox(
                        width: 324.w,
                        child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Welcome to Research Hub!",
                                  style: GoogleFonts.inter(
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Gap(14.w),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Sign in to discover amazing student projects and innovations",
                                  style: GoogleFonts.inter(fontSize: 17.sp),
                                ),
                              ),
                              Gap(40.w),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Email",
                                  style: GoogleFonts.inter(fontSize: 15.sp),
                                ),
                              ),
                              Gap(5.w),
                              OutlinedTextField(
                                controller: emailController,
                                icon: Icon(Iconsax.user_copy),
                                text: "Enter your email",
                              ),

                              Gap(27.w),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Password",
                                    style: GoogleFonts.inter(fontSize: 15.sp),
                                  ),
                                  GestureDetector(
                                    onTap: () => Get.toNamed('/forgotPassword'),
                                    child: Text(
                                      "Forgot password?",
                                      style: GoogleFonts.inter(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: ColorName.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gap(5.w),
                              OutlinedTextField(
                                controller: passwordController,
                                icon: Icon(Icons.lock_outline),
                                text: "Enter your password",
                                isPassword: true,
                                isDone: true,
                              ),
                              Gap(54.w),
                              PrimaryButton(
                                textColor: Colors.white,
                                buttonColor: ColorName.primaryColor,
                                width: 324.w,
                                text: "Sign In",
                                onPressed: login,
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
      ),
    );
  }
}
