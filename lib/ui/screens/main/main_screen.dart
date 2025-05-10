import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:research_hub/responsive/responsive_layout.dart';
import 'package:research_hub/ui/screens/main/main_desktop.dart';
import 'package:research_hub/ui/screens/main/main_mobile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MainMobile(),
      tablet: MainMobile(),
      desktop: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.landscape
              ? MainDesktop()
              : MainMobile();
        },
      ),
    );
  }
}
