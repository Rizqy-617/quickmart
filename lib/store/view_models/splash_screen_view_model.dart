import 'package:quickmart/store/action/theme_action.dart';
import 'package:quickmart/store/models/app_state.dart';
import 'package:redux/redux.dart';

class SplashScreenViewModel {
  final Function() toggleDarkMode;

  SplashScreenViewModel({
    required this.toggleDarkMode
  });

  factory SplashScreenViewModel.create(Store<AppState> store) {
    _onToggleDarkMode() {
      store.dispatch(ThemeAction());
    }
  }
}