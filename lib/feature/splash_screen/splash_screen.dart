import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:quickmart/store/action/theme_action.dart';
import 'package:quickmart/store/models/app_state.dart';
import 'package:quickmart/template/theme_colors.dart';
import 'package:redux/redux.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state.theme,
      builder: (context, theme) {
        Store<AppState> store;
        return Scaffold(
          backgroundColor: ThemeColors.instance.primaryBackgrounColor(theme),
          floatingActionButton: FloatingActionButton(
            heroTag: "1",
            onPressed: () {
              store.dispatch(ThemeAction(theme));
            },
          ),
          body: Center(
            child: Image.asset(
              theme == ThemeScheme.light ? 
              "assets/icon/app_icon/icon_app@2x.png" :
              "assets/icon/app_icon/icon_app_dark@2x.png",
              width: 300,
              height: 100,
            ),
          ),
        );
      },
    );
  }
}