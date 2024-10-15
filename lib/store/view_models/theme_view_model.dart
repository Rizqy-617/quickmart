// import 'package:quickmart/store/action/theme_action.dart';
// import 'package:quickmart/store/models/app_state.dart';
// import 'package:redux/redux.dart';

// class ThemeViewModel {
//   final bool? darkModeOn;
//   final Function() toggleDarkMode;

//   ThemeViewModel({
//     required this.darkModeOn,
//     required this.toggleDarkMode
//   });

//   factory ThemeViewModel.create(Store<AppState> store) {
//     onToggleDarkMode() {
//       store.dispatch(ThemeAction());
//     }

//     return ThemeViewModel(
//       darkModeOn: store.state.theme.darkModeEnabled,
//       toggleDarkMode: onToggleDarkMode
//     );
//   }
// }