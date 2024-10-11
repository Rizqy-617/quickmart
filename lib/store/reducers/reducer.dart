import 'package:quickmart/store/models/app_state.dart';
import 'package:quickmart/store/reducers/theme_reducer.dart';
import 'package:quickmart/store/reducers/user_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    user: userReducer(state.user, action),
    theme: themeReducer(state.theme, action)
  );
}
