import 'package:quickmart/template/theme_colors.dart';

class ThemeModel {
  bool? darkModeEnabled;
  ThemeScheme? scheme;

  ThemeModel({
    this.darkModeEnabled,
    this.scheme
  });

  static ThemeModel init() {
    return ThemeModel(
      darkModeEnabled: false,
      scheme: ThemeScheme.light
    );
  }
}