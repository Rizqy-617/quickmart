import 'package:quickmart/store/action/action.dart';
import 'package:quickmart/store/config/app_state.dart';
import 'package:quickmart/template/theme_colors.dart';
import 'package:quickmart/utils/secure_storage.dart';

class ThemeReducer {
  ActionOperation action;
  dynamic payload;

  ThemeReducer({ required this.action, required this.payload });

  AppState mapOperationToState(AppState state) {
    switch (action) {
      case ActionOperation.setTheme:
        if (payload is ThemeScheme) {
          int index = payload == ThemeScheme.light ? 0 : 1;
          SecureStorage.instance.updateToken(CacheKey.theme, "$index");
          return state.remake(
            mScheme: payload
          );
        }
      default:
        return state;
    }

    return state;
  }
}