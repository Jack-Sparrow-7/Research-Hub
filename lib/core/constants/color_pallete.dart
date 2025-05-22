import 'dart:math';

import 'package:flutter/material.dart';

class ColorPallete {
  ColorPallete._();

  static final Random _random = Random();

  static Color primaryColor = Color.fromRGBO(109, 87, 252, 1);
  static Color secondaryColor = Color.fromRGBO(109, 87, 252, .5);
  static Color scaffoldColor = Color.fromRGBO(240, 242, 245, 1);
  static Color greyColor = Color.fromRGBO(156, 163, 175, 1);
  static Color redColor = Color.fromRGBO(220, 38, 38, 1);
  static Color fieldBorder = Color.fromRGBO(209, 213, 219, 1);
  static Color primaryChip = Color.fromRGBO(250, 245, 255, 1);
  static Color greenChip = Color.fromRGBO(240, 253, 244, 1);
  static Color greyChip = Color.fromRGBO(243, 244, 246, 1);
  static Color tileColor = Color.fromRGBO(249, 250, 251, 1);
  static List<Color> predefinedColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.indigo,
  ];

  static Color getRandomColor() {
    // return predefinedColors[_random.nextInt(predefinedColors.length)];
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  static Color getTextColor(Color background) {
    return background.computeLuminance() > .5 ? Colors.black : Colors.white;
  }
}
