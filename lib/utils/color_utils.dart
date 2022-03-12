import 'package:flutter/material.dart';

abstract class ColorUtils {
  static int alpha(String code) {
    try {
      int length = code.length;
      if (length < 8) return 255;
      return int.parse(code.substring(0, 2), radix: 16);
    } catch (e) {
      return 0;
    }
  }

  static int red(String code) {
    try {
      int length = code.length;
      if (length == 3) {
        var s = code.substring(0, 1);
        s += s;
        return int.parse(s, radix: 16);
      } else if (length == 6) {
        return int.parse(code.substring(0, 2), radix: 16);
      } else {
        return int.parse(code.substring(2, 4), radix: 16);
      }
    } catch (e) {
      return 0;
    }
  }

  static int green(String code) {
    try {
      int length = code.length;
      if (length == 3) {
        var s = code.substring(1, 2);
        s += s;
        return int.parse(s, radix: 16);
      } else if (length == 6) {
        return int.parse(code.substring(2, 4), radix: 16);
      } else {
        return int.parse(code.substring(4, 6), radix: 16);
      }
    } catch (e) {
      return 0;
    }
  }

  static int blue(String code) {
    try {
      int length = code.length;
      if (length == 3) {
        var s = code.substring(2, 3);
        s += s;
        return int.parse(s, radix: 16);
      } else if (length == 6) {
        return int.parse(code.substring(4, 6), radix: 16);
      } else {
        return int.parse(code.substring(6), radix: 16);
      }
    } catch (e) {
      return 0;
    }
  }

  static Color toColor(String? color, {Color defaultColor = Colors.black}) {
    if (color == null || color.isEmpty) {
      return defaultColor;
    }
    if (!color.contains("#")) {
      return defaultColor;
    }
    String hexColor = color.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "0xff" + hexColor;
      Color color = Color(int.parse(hexColor));
      return color;
    }
    if (hexColor.length == 8) {
      Color color = Color(int.parse("0x$hexColor"));
      return color;
    }
    return defaultColor;
  }

  static String colorString(Color color) {
    int value = color.value;
    String radixString = value.toRadixString(16);
    String colorString = radixString.padLeft(8, '0').toUpperCase();
    return "#$colorString";
  }
}
