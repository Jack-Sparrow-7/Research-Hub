import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:research_hub/core/constants/color_pallete.dart';
import 'package:research_hub/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:research_hub/features/auth/presentation/cubit/auth_status_cubit.dart';
import 'package:research_hub/features/auth/presentation/cubit/hide_text_cubit.dart';
import 'package:research_hub/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:research_hub/features/auth/presentation/widgets/auth_button.dart';
import 'package:research_hub/features/auth/presentation/widgets/auth_field.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.scaffoldColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64.w),
        child: AuthAppBar(),
      ),

      body: Center(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AutheError) {
              Get.showSnackbar(
                GetSnackBar(
                  message: state.erroMessage,
                  duration: Duration(seconds: 2),
                ),
              );
            } else if (state is Authenticated) {
              context.read<AuthStatusCubit>().checkAdminStatus(
                uid: state.user.uid,
              );
              emailController.clear();
              passwordController.clear();
              Get.offAllNamed('/main');
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return CircularProgressIndicator(
                color: ColorPallete.primaryColor,
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
                    child: LoginForm(
                      formKey: formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.viewInsetsOf(context).bottom,
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

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
            child: Text("Email", style: GoogleFonts.inter(fontSize: 15.sp)),
          ),
          Gap(5.w),
          BlocProvider(
            create: (context) => HideTextCubit(),
            child: AuthField(
              controller: emailController,
              icon: Icon(Iconsax.user_copy),
              text: "Enter your email",
              missingText: "Email",
            ),
          ),

          Gap(27.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Password", style: GoogleFonts.inter(fontSize: 15.sp)),
              GestureDetector(
                onTap: () => Get.toNamed('/forgotPassword'),
                child: Text(
                  "Forgot password?",
                  style: GoogleFonts.inter(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorPallete.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          Gap(5.w),
          BlocProvider(
            create: (context) => HideTextCubit(),
            child: AuthField(
              controller: passwordController,
              icon: Icon(Icons.lock_outline),
              text: "Enter your password",
              missingText: "Password",
              isPassword: true,
              isDone: true,
            ),
          ),
          Gap(54.w),
          AuthButton(
            text: "Sign in",
            onPressed: () {
              FocusScope.of(context).unfocus();
              if (formKey.currentState!.validate()) {
                context.read<AuthBloc>().add(
                  AuthLogin(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
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
            },
          ),
        ],
      ),
    );
  }
}
