import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key, required this.mobile, required this.tablet, required this.desktop});

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context)=> mobile,
      tablet: (context) => tablet,
      desktop: (context)=>desktop,
    );
  }
}