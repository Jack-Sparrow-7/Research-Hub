import 'package:flutter/material.dart';
import 'package:research_hub/core/responsive/responsive_layout.dart';
import 'package:research_hub/features/profile/presentation/screens/edit%20profile/edit_profile_desktop.dart';
import 'package:research_hub/features/profile/presentation/screens/edit%20profile/edit_profile_mobile.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: EditProfileMobile(),
      tablet: EditProfileMobile(),
      desktop: EditProfileDesktop(),
    );
  }
}