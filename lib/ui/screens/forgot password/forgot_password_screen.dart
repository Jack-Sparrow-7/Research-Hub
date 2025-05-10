import 'package:flutter/widgets.dart';
import 'package:research_hub/responsive/responsive_layout.dart';
import 'package:research_hub/ui/screens/forgot%20password/forgot_password_desktop.dart';
import 'package:research_hub/ui/screens/forgot%20password/forgot_password_mobile.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: ForgotPasswordMobile(),
      tablet: ForgotPasswordMobile(),
      desktop: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.landscape
              ? ForgotPasswordDesktop()
              : ForgotPasswordMobile();
        },
      ),
    );
  }
}
