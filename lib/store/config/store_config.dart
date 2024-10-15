import 'package:quickmart/models/user_model.dart';
import 'package:quickmart/store/config/app_state.dart';
import 'package:quickmart/store/reducers/reducer.dart';
import 'package:quickmart/template/theme_colors.dart';
import 'package:quickmart/utils/secure_storage.dart';
import 'package:redux/redux.dart';

class StoreConfig {
  StoreConfig._privateConstructor();
  static final StoreConfig instance = StoreConfig._privateConstructor();

  Future<Store<AppState>> getStore() async {
    int? index = int.tryParse(await SecureStorage.instance.getToken(CacheKey.theme) ?? "");

    return Store<AppState>(
      reducer,
      initialState: AppState(
        user: User.init(),
        scheme: index != null ? ThemeScheme.values[index] : ThemeScheme.light
      )
    );
  }
}