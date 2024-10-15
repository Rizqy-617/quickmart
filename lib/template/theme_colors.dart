import 'package:flutter/material.dart';

enum ThemeScheme { light, dark }

class ThemeColors {
  ThemeColors._privateConstructor();
  static final ThemeColors instance =  ThemeColors._privateConstructor();

  // light color scheme
  static Color primaryColorLight = const Color(0xff21D4B4);
  static Color primaryContainerLight = const Color(0xffF4FDFA);
  static Color primaryBlack = const Color(0xff1C1B1B);
  static Color primaryWhite = const Color(0xffFFFFFF);
  static Color lightGrey1 = const Color(0xffF4F5FD);
  static Color lightGrey2 = const Color(0xff6F7384);

  // netral
  static Color netralGrey = const Color(0xffC0C0C0);

  // dark color scheme
  static Color primaryColorDark = const Color(0xff21D4B4);
  static Color primaryContainerDark = const Color(0xff212322);

  // general
  static Color red = const Color(0xffEE4D4D);
  static Color cyan = const Color(0xffF4FDFA);
  static Color blue = const Color (0xff1F88DA);
  static Color yellow = const Color(0xffEBEF14);
  static Color orange = const Color(0xffF0821D);

  Color primaryBackgrounColor(ThemeScheme theme) {
    return theme == ThemeScheme.light ? primaryWhite : primaryBlack;
  }

  Color btnColorBlock(ThemeScheme theme) {
    return theme == ThemeScheme.light ? primaryBlack : primaryColorLight;
  }

  Color btnColorBlockTxt(ThemeScheme theme) {
    return theme == ThemeScheme.light ? primaryWhite : primaryWhite;
  }

  Color primaryContainerColor(ThemeScheme theme) {
    return theme == ThemeScheme.light ? primaryContainerLight : primaryContainerDark;
  }
}



// ColorScheme lightScheme() {
//   return ColorScheme(
//     brightness: Brightness.light,
//     primary: ThemeColors.primaryColorLight,
//     onPrimary: ThemeColors.primaryBlack,
//     secondary: ThemeColors.primaryContainerLight,
//     onSecondary: ThemeColors.lightGrey2,
//     surface: ThemeColors.primaryWhite,
//     onSurface: ThemeColors.lightGrey2,
//     error: ThemeColors.red,
//     onError: ThemeColors.primaryWhite
//   );
// }

// ColorScheme lightScheme() {
//   return const ColorScheme(
//     brightness: Brightness.light,
//     primary: Color(0xff21D4B4),
//     surfaceTint: Color(0xff21D4B4),
//     onPrimary: Color(0xffffffff),
//     primaryContainer: Color(0xffF4FDFA),
//     onPrimaryContainer: Color(0xff003e33),
//     secondary: Color(0xff33675b),
//     onSecondary: Color(0xffffffff),
//     secondaryContainer: Color(0xffb9f0e0),
//     onSecondaryContainer: Color(0xff1b5246),
//     tertiary: Color(0xff57605e),
//     onTertiary: Color(0xffffffff),
//     tertiaryContainer: Color(0xfff5fefb),
//     onTertiaryContainer: Color(0xff4f5856),
//     error: Color(0xffba1a1a),
//     onError: Color(0xffffffff),
//     errorContainer: Color(0xffffdad6),
//     onErrorContainer: Color(0xff410002),
//     surface: Color(0xfff3fbf7),
//     onSurface: Color(0xff161d1b),
//     onSurfaceVariant: Color(0xff444748),
//     outline: Color(0xff747878),
//     outlineVariant: Color(0xffc4c7c8),
//     shadow: Color(0xff000000),
//     scrim: Color(0xff000000),
//     inverseSurface: Color(0xff2a322f),
//     inversePrimary: Color(0xff35debd),
//     primaryFixed: Color(0xff5dfbd9),
//     onPrimaryFixed: Color(0xff00201a),
//     primaryFixedDim: Color(0xff35debd),
//     onPrimaryFixedVariant: Color(0xff005143),
//     secondaryFixed: Color(0xffb7eedd),
//     onSecondaryFixed: Color(0xff00201a),
//     secondaryFixedDim: Color(0xff9bd1c2),
//     onSecondaryFixedVariant: Color(0xff184f43),
//     tertiaryFixed: Color(0xffdbe4e2),
//     onTertiaryFixed: Color(0xff151d1c),
//     tertiaryFixedDim: Color(0xffbfc8c6),
//     onTertiaryFixedVariant: Color(0xff404947),
//     surfaceDim: Color(0xffd4dcd8),
//     surfaceBright: Color(0xfff3fbf7),
//     surfaceContainerLowest: Color(0xffffffff),
//     surfaceContainerLow: Color(0xffeef5f1),
//     surfaceContainer: Color(0xffe8f0eb),
//     surfaceContainerHigh: Color(0xffe2eae6),
//     surfaceContainerHighest: Color(0xffdce4e0),
//   );
// }

// ColorScheme darkScheme() {
//   return const ColorScheme(
//     brightness: Brightness.dark,
//     primary: Color(0xff5af8d7),
//     surfaceTint: Color(0xff35debd),
//     onPrimary: Color(0xff00382e),
//     primaryContainer: Color(0xff0acdad),
//     onPrimaryContainer: Color(0xff212322),
//     secondary: Color(0xff9bd1c2),
//     onSecondary: Color(0xff00382e),
//     secondaryContainer: Color(0xff0e483d),
//     onSecondaryContainer: Color(0xffa9e0d0),
//     tertiary: Color(0xffc6c7c5),
//     onTertiary: Color(0xff2f3130),
//     tertiaryContainer: Color(0xff191b1a),
//     onTertiaryContainer: Color(0xffa5a6a4),
//     error: Color(0xffffb4ab),
//     onError: Color(0xff690005),
//     errorContainer: Color(0xff93000a),
//     onErrorContainer: Color(0xffffdad6),
//     surface: Color(0xff0e1513),
//     onSurface: Color(0xffdce4e0),
//     onSurfaceVariant: Color(0xffc4c7c4),
//     outline: Color(0xff8e928f),
//     outlineVariant: Color(0xff444846),
//     shadow: Color(0xff000000),
//     scrim: Color(0xff000000),
//     inverseSurface: Color(0xffdce4e0),
//     inversePrimary: Color(0xff006b59),
//     primaryFixed: Color(0xff5dfbd9),
//     onPrimaryFixed: Color(0xff00201a),
//     primaryFixedDim: Color(0xff35debd),
//     onPrimaryFixedVariant: Color(0xff005143),
//     secondaryFixed: Color(0xffb7eedd),
//     onSecondaryFixed: Color(0xff00201a),
//     secondaryFixedDim: Color(0xff9bd1c2),
//     onSecondaryFixedVariant: Color(0xff184f43),
//     tertiaryFixed: Color(0xffe2e3e1),
//     onTertiaryFixed: Color(0xff1a1c1b),
//     tertiaryFixedDim: Color(0xffc6c7c5),
//     onTertiaryFixedVariant: Color(0xff454746),
//     surfaceDim: Color(0xff0e1513),
//     surfaceBright: Color(0xff333b38),
//     surfaceContainerLowest: Color(0xff08100e),
//     surfaceContainerLow: Color(0xff161d1b),
//     surfaceContainer: Color(0xff1a211f),
//     surfaceContainerHigh: Color(0xff242c29),
//     surfaceContainerHighest: Color(0xff2f3634),
//   );
// }