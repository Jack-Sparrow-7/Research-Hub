import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthBox extends StatelessWidget {
  const AuthBox({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .1),
              offset: Offset(0, 0),
              blurRadius: 10.r,
              spreadRadius: 3.r,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
