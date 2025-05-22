import 'package:flutter/material.dart';
import 'package:research_hub/core/responsive/responsive_layout.dart';
import 'package:research_hub/features/auth/presentation/screens/forgot%20password%20screen/forgot_password_desktop.dart';
import 'package:research_hub/features/auth/presentation/screens/forgot%20password%20screen/forgot_password_mobile.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: ForgotPasswordMobile(),
      tablet: ForgotPasswordMobile(),
      desktop: ForgotPasswordDesktop(),   
    );
  }
}