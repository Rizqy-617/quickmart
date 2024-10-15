import 'package:quickmart/store/config/app_state.dart';
import 'package:quickmart/store/reducers/theme_reducer.dart';
import 'package:quickmart/store/reducers/user_reducer.dart';
import 'package:redux/redux.dart';

// AppState appReducer(AppState state, dynamic action) {
//   return AppState(
//     user: userReducer(state.user, action),
//     theme: themeReducer(state.theme, action)
//   );
// }

// AppState setUser(AppState state, User user) {
//   return state.remake(
//     mUser: user
//   );
// }

// Store<AppState>? store;
// // Store<AppState> getStore(BuildContext context) {
// //   return StoreProvider.of<AppState>(context);
// // }

AppState reducer(AppState state, dynamic action) {
  if (action is UserReducer) {
    return action.mapOperationToState(state);
  } else if (action is ThemeReducer) {
    return action.mapOperationToState(state);
  }

  return state;
}

Store<AppState>? store;
