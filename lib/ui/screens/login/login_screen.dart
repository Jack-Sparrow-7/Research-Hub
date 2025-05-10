import 'package:flutter/material.dart';
import 'package:research_hub/responsive/responsive_layout.dart';
import 'package:research_hub/ui/screens/login/login_desktop.dart';
import 'package:research_hub/ui/screens/login/login_mobile.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: LoginMobile(),
      tablet: LoginMobile(),
      desktop: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.landscape
              ? LoginDesktop()
              : LoginMobile();
        },
      ),
    );
  }
}
