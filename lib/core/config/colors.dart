import 'package:flutter/material.dart';

/// this function will generate color shades and tints from a solid color
/// and will retun [MaterialColor]. so that we can use any color as material color
/// property. from a solid color it will generate `shade100` to `shade900`.and `shade500`
/// will be base color.
MaterialColor createMaterialColor(Color baseColor) {
  Color color = baseColor;
  int shadeCount = 0;
  int tintCount = 0;
  int mid = 0;
  const double mixPercent = 0.15;
  final swatch = <int, Color>{};
  for (int i = 1; i <= 10; i++) {
    final Color? tint = Color.lerp(color, Colors.white, mixPercent);
    color = tint!;
    if (color.red >= 250 && color.green >= 250 && color.blue >= 250) {
      break;
    }
    tintCount++;
  }
  color = baseColor;
  for (int i = 1; i <= 10; i++) {
    final Color? shade = Color.lerp(color, Colors.black, mixPercent);
    color = shade!;
    if (color.red <= 15 && color.green <= 15 && color.blue <= 15) {
      break;
    }
    shadeCount++;
  }

  if (shadeCount >= 4 && tintCount >= 4) {
    mid = 5;
  } else if (shadeCount < 4) {
    mid = 10 - shadeCount;
  } else if (tintCount < 4) {
    mid = tintCount + 1;
  }
  color = baseColor;
  if (mid == 1) {
    swatch[50] = baseColor;
  } else {
    swatch[(mid * 100)] = baseColor;
  }
  for (int i = mid - 1; i >= 1; i--) {
    final Color? tint = Color.lerp(color, Colors.white, mixPercent);
    color = tint!;
    swatch[(i * 100)] = tint;
    if (i == 1) {
      final Color? tint50 = Color.lerp(color, Colors.white, mixPercent);
      swatch[50] = tint50!;
    }
  }
  color = baseColor;
  for (int i = mid; i <= 10; i++) {
    final Color? shade = Color.lerp(color, Colors.black, mixPercent);
    color = shade!;
    swatch[(i * 100)] = shade;
  }
  return MaterialColor(baseColor.value, swatch);
}

/// project colors
class CColor {
  /// primary color for a project that can be use as a [ColorScheme] inside material
  /// theme property.
  static MaterialColor primary = createMaterialColor(const Color(0xFF006C4A));

  /// warning color for a project that can be use as a [ColorScheme] inside material
  /// theme property. or use can use for any warning related color.
  static MaterialColor warning = createMaterialColor(const Color(0xFFF39F1D));

  /// danger color for a project that can be use as a [ColorScheme] inside material
  /// theme property. or use can use for any danger related color.
  static MaterialColor danger = createMaterialColor(const Color(0xFFD40022));

  /// success color for a project that can be use as a [ColorScheme] inside material
  /// theme property. or use can use for any success related color.
  static MaterialColor success = createMaterialColor(const Color(0xFF37AD57));

  /// info color for a project that can be use as a [ColorScheme] inside material
  /// theme property. or use can use for any info related color.
  static MaterialColor info = createMaterialColor(const Color(0xFF0758CE));

  /// disable color for a project that can be use as a [ColorScheme] inside material
  /// theme property. or use can use for any disable related color.
  static MaterialColor disable = createMaterialColor(const Color(0xFFBEBEBE));

  /// secondary color for a project that can be use as a [ColorScheme] inside material
  /// theme property. or use can use for any secondary related color.
  static MaterialColor secondary = createMaterialColor(const Color(0xFFFF752D));

  /// text colors
  static MaterialColor text = createMaterialColor(const Color(0xFF2D2D2D));

  /// backgroundColor for projects
  static const backgroundColor = Colors.white;

  /// disableText for projects
  static const disableText = Color(0xFF838699);

  /// just another info shade
  static const infoShade20 = Color(0xFFCEE6FC);

  /// breeze buy brand color shade 50
  static const brand50 = Color(0xFFE3FFF3);

  /// breeze buy brand color shade 100
  static const brand100 = Color(0xFF7BB29A);

  /// breeze buy brand color shade 200
  static const brand200 = Color(0xFF689D86);

  /// breeze buy brand color shade 300
  static const brand300 = Color(0xFF567F6D);

  /// breeze buy brand color shade 400
  static const brand400 = Color(0xFF36765C);

  /// breeze buy brand color
  static const brand = Color(0xFF006C4A);

  /// breeze buy brand color shade 600
  static const brand600 = Color(0xFF006C4A);

  /// breeze buy brand color shade 700
  static const brand700 = Color(0xFF004C33);

  /// breeze buy brand color shade 800
  static const brand800 = Color(0xFF003E27);

  /// breeze buy brand color shade 900
  static const brand900 = Color(0xFF002315);

  /// breeze buy main gradient color
  static const brandGra1 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF00D894), Color(0xFF006C4A)],
  );

  /// breeze buy gray shade
  static const st1 = Color(0xFF6C7E8B);

  /// breeze buy gray shade
  static const st2 = Color(0xFFbEBEBE);

  /// breeze buy gray shade
  static const st3 = Color(0xFFE8E8E8);

  /// breeze buy gray shade
  static const st4 = Color(0xFFfAFAFA);

  /// breeze buy gray shade
  static const st5 = Color(0xFF3E2726);

  /// breeze buy gray shade
  static const sc2 = Color(0xFFBEBEBE);

  /// breeze buy accent color
  static const ac1 = Color(0xFFFF752D);

  /// breeze buy accent color
  static const ac2 = Color(0xFFFFE500);

  /// breeze buy accent color
  static const ac3 = Color(0xFFFF6262);

  /// breeze buy positive color
  static const positive = Color(0xFF24A524);

  /// project colors that will retun all color property as static variabble
  CColor();
}

/// get [InverseBW] color
class InverseBW {
  double _calculateLuminance(List<int> rgb) {
    return 0.2126 * rgb[0] + 0.7152 * rgb[1] + 0.0722 * rgb[2];
  }

  List<int> _hexToRBG(String colorStr) {
    final List<int> rbg = [];
    rbg.add(int.parse(colorStr.substring(1, 3), radix: 16));
    rbg.add(int.parse(colorStr.substring(3, 5), radix: 16));
    rbg.add(int.parse(colorStr.substring(5, 7), radix: 16));
    return rbg;
  }

  /// this will return Inverse black or white color based on input color
  String getInverseBW(String hexColor) {
    final double luminance = _calculateLuminance(_hexToRBG(hexColor));
    final String inverse = (luminance < 140) ? "#ffffff" : "#000000";
    return inverse;
  }
}
