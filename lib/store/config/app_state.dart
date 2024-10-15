import 'package:quickmart/models/user_model.dart';
import 'package:quickmart/template/theme_colors.dart';

class AppState {
  User user = User.init();
  ThemeScheme scheme = ThemeScheme.light;

  AppState({
    required this.user,
    required this.scheme
  });

  AppState remake({
    User? mUser,
    ThemeScheme? mScheme
  }) {
    User tmpUser = mUser ?? user;
    ThemeScheme tmpScheme = mScheme ?? scheme;
    return AppState(
      user: tmpUser,
      scheme: tmpScheme
    );
  }
}