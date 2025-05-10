import 'package:flutter/material.dart';
import 'package:research_hub/responsive/device_info_service.dart';
import 'package:research_hub/responsive/responsive_layout.dart';
import 'package:research_hub/ui/screens/get%20started/get_started_desktop.dart';
import 'package:research_hub/ui/screens/get%20started/get_started_mobile.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: GetStartedMobile(),
      tablet: GetStartedMobile(),
      desktop:
          DeviceInfoService.isLandscape
              ? GetStartedDesktop()
              : GetStartedMobile(),
    );
  }
}
