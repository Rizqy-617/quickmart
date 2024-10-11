import 'package:quickmart/template/theme_colors.dart';
import 'package:quickmart/models/user_model.dart';
import 'package:quickmart/store/models/app_state.dart';
import 'package:quickmart/store/reducers/reducer.dart';
import 'package:redux/redux.dart';

class StoreConfig {
  StoreConfig._privateConstructor();
  static final StoreConfig instance = StoreConfig._privateConstructor();

  Future<Store<AppState>> getStore() async {
    return Store<AppState>(
      appReducer,
      initialState: AppState(
        user: User.init(),
        theme: ThemeScheme.light
      )
    );
  }
}