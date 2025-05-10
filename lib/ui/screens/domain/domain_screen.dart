import 'package:flutter/material.dart';
import 'package:research_hub/responsive/responsive_layout.dart';
import 'package:research_hub/ui/screens/domain/domain_desktop.dart';
import 'package:research_hub/ui/screens/domain/domain_mobile.dart';

class DomainScreen extends StatelessWidget {
  const DomainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: DomainMobile(),
      tablet: DomainMobile(),
      desktop: DomainDesktop(),
    );
  }
}
