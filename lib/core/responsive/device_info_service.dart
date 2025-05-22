import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DeviceInfoService {
  static late DeviceScreenType deviceType;
  static late Orientation orientation;

  static void init(BuildContext context) {
    final mediaQuerySize = MediaQuery.sizeOf(context);
    final mediaQueryOrientation = MediaQuery.orientationOf(context);
    deviceType = getDeviceType(mediaQuerySize);
    orientation = mediaQueryOrientation;
  }

  static bool get isPotrait => orientation == Orientation.portrait;
  static bool get isLandscape => orientation == Orientation.landscape;
  static bool get isMobile => deviceType == DeviceScreenType.mobile;
  static bool get isTablet => deviceType == DeviceScreenType.tablet;
  static bool get isDesktop =>
      deviceType == DeviceScreenType.desktop && isLandscape;
}