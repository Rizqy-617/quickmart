import 'package:quickmart/models/user_model.dart';
import 'package:quickmart/store/action/action.dart';
import 'package:quickmart/store/config/app_state.dart';
import 'package:quickmart/template/route.dart';
import 'package:quickmart/template/theme_colors.dart';

class UserReducer {
  ActionOperation action;
  dynamic payload;

  UserReducer({required this.action, required this.payload});

  AppState mapOperationToState(AppState state) {
    switch(action) {
      case ActionOperation.setUser:
        if (payload is User) {
          return state.remake(
            mUser: payload
          );
        }
        return state.remake(
          mUser: User.init(),
        );
      case ActionOperation.clearState:
        return state.remake(
          mUser: User.init(),
          mScheme: ThemeScheme.light,
          mHomeTab: HomeTab.home
        );
      default:
        return state;
    }
  }
}