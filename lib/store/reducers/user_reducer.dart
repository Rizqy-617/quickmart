import 'package:quickmart/models/user_model.dart';
import 'package:quickmart/store/action/user_action.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<User>([
  TypedReducer<User, LoginAction>(_loginUserReducer).call,
]);

User _loginUserReducer(User user, LoginAction action) {
  return action.user;
}