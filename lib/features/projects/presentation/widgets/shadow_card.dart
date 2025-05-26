import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShadowCard extends StatelessWidget {
  const ShadowCard({super.key, required this.color, required this.child});

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 10.r,
            spreadRadius: 3.r,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: child,
    );
  }
}
