import 'package:flutter/material.dart';
import 'package:research_hub/responsive/responsive_layout.dart';
import 'package:research_hub/ui/screens/change%20password/change_password_desktop.dart';
import 'package:research_hub/ui/screens/change%20password/change_password_mobile.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: ChangePasswordMobile(),
      tablet: ChangePasswordMobile(),
      desktop: ChangePasswordDesktop(),
    );
  }
}