import 'package:quickmart/models/user_model.dart';
import 'package:quickmart/template/route.dart';
import 'package:quickmart/template/theme_colors.dart';

class AppState {
  User user = User.init();
  ThemeScheme scheme = ThemeScheme.light;
  HomeTab homeTab = HomeTab.home;

  AppState({
    required this.user,
    required this.scheme,
    required this.homeTab
  });

  AppState remake({
    User? mUser,
    ThemeScheme? mScheme,
    HomeTab? mHomeTab,
  }) {
    User tmpUser = mUser ?? user;
    ThemeScheme tmpScheme = mScheme ?? scheme;
    HomeTab tmpHomeTab = mHomeTab ?? homeTab;
    return AppState(
      user: tmpUser,
      scheme: tmpScheme,
      homeTab: tmpHomeTab
    );
  }
}