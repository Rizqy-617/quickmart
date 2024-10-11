import 'package:quickmart/template/theme_colors.dart';
import 'package:quickmart/store/action/theme_action.dart';
import 'package:redux/redux.dart';

final themeReducer = combineReducers<ThemeScheme>([
  TypedReducer<ThemeScheme, ThemeAction>(_changeThemeReducer).call
]);

ThemeScheme _changeThemeReducer(ThemeScheme theme, ThemeAction action) {
  return action.theme;
}