import 'package:quickmart/models/user_model.dart';
import 'package:quickmart/store/action/action.dart';
import 'package:quickmart/store/config/app_state.dart';
import 'package:quickmart/template/theme_colors.dart';
// final userReducer = combineReducers([
//   TypedReducer<User, LoginAction>(_loginUserReducer).call,
// ]);

// User _loginUserReducer(User state, LoginAction action) {
//   Future.delayed(Duration.zero).then((_) async {
//     Map result = await Request.authorizeRequest(
//       url: "https://dummyjson.com/auth/login",
//       postParam: {
//         "username": action.email,
//         "password": action.password,
//         "expiresInMins": 60
//       }
//     );
//     User newUser = User.fromMap(result);
//     UserToken token = UserToken(accessToken: result["accessToken"], refreshToken: result["refreshToken"]);
//     bool refreshToken = await SecureStorage.instance.updateToken(CacheKey.refreshToken, token.refreshToken);
//     bool accessToken = await SecureStorage.instance.updateToken(CacheKey.accessToken, token.accessToken);
//     // if (refreshToken && accessToken) {
//     //   return true;
//     // }

//     print("masuk sini");
//     if (refreshToken && accessToken) {
//       print(newUser.username);
//       store?.dispatch(setUser(store!.state, newUser));
//       print(store?.state.user.age);
//       return newUser;
//     }
//   });
//   print("sini duluan");
//   return User.init();
// }

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
          mScheme: ThemeScheme.light
        );
      default:
        return state;
    }
  }
}