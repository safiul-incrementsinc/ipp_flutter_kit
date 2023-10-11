import 'package:flutter/material.dart';

/// custom extension that will work with [BuildContext]
extension XBuildContext on BuildContext {
  /// get theme colorScheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// get textTheme of the project
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// get elevatedButtonTheme of the project
  ElevatedButtonThemeData get elevatedButtonTheme =>
      Theme.of(this).elevatedButtonTheme;

  /// get textButtonTheme of the project
  TextButtonThemeData get textButtonTheme => Theme.of(this).textButtonTheme;

  /// get outlineButtonTheme of the project
  OutlinedButtonThemeData get outlineButtonTheme =>
      Theme.of(this).outlinedButtonTheme;

  /// get filledButtonTheme of the project
  FilledButtonThemeData get filledButtonTheme =>
      Theme.of(this).filledButtonTheme;

  /// get inputDecorationTheme of the project
  InputDecorationTheme get inputDecorationTheme =>
      Theme.of(this).inputDecorationTheme;

  /// get cardTheme of the project
  ShapeBorder? get cardTheme => Theme.of(this).cardTheme.shape;
}

/// extensions for `List<Widget>`
extension ListSpaceBetweenExtension on List<Widget> {
  ///  this extension will add [SizedBox] for spacing between all widgets of a list.
  List<Widget> withSpaceBetween({double? width, double? height}) => [
        for (int i = 0; i < length; i++) ...[
          if (i > 0) SizedBox(width: width, height: height),
          this[i],
        ],
      ];
}

/// this extension hold some usefully string manipulation technique xD
extension StringExtension on String {
  /// this method will Capitalize first letter of a [String]
  String toCapitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  /// this method will remove all `_` from the [String] and return a readable text.
  String toSentenceCase() {
    return replaceAll('_', ' ').replaceAllMapped(RegExp(r"\w\S*"),
        (Match match) {
      return match[0]![0].toUpperCase() + match[0]!.substring(1).toLowerCase();
    });
  }
}

/// this extension work with color
extension HexColor on Color {
  /// this method will return [Color] from a hex color value
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// this method will return a hex color string from [Color]
  String toHex({bool leadingHashSign = true}) {
    final string = '${leadingHashSign ? '#' : ''}'
        '${alpha.toRadixString(16).padLeft(2, '0')}'
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}';
    return '#${string.substring(3)}';
  }
}
