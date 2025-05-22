import 'package:flutter/material.dart';
import 'package:research_hub/core/responsive/responsive_layout.dart';
import 'package:research_hub/features/auth/presentation/screens/login%20screen/login_desktop.dart';
import 'package:research_hub/features/auth/presentation/screens/login%20screen/login_mobile.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: LoginMobile(),
      tablet: LoginMobile(),
      desktop: LoginDesktop(),
    );
  }
}
