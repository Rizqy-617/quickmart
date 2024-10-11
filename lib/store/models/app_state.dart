import 'package:quickmart/template/theme_colors.dart';
import 'package:quickmart/models/user_model.dart';

class AppState {
  User user = User.init();
  ThemeScheme theme = ThemeScheme.light;

  AppState({
    required this.user,
    required this.theme
  });

  AppState remake({
    User? mUser,
    ThemeScheme? mTheme
  }) {
    User tmpUser = mUser ?? user;
    ThemeScheme tmpTheme = mTheme ?? theme;
    return AppState(
      user: tmpUser,
      theme: tmpTheme
    );
  }
}