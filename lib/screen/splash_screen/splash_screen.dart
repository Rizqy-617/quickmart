import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:quickmart/store/action/action.dart';
import 'package:quickmart/store/config/app_state.dart';
import 'package:quickmart/store/reducers/reducer.dart';
import 'package:quickmart/store/reducers/theme_reducer.dart';
import 'package:quickmart/store/view_models/user_view_model.dart';
import 'package:quickmart/template/route.dart';
import 'package:quickmart/template/theme_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      bool hasToken = await UserViewModel.instance.hasToken();
      if (hasToken) await UserViewModel.instance.refreshUserData();
      bool hasLogin = UserViewModel.instance.hasLogin();
      if (hasLogin) {
        Navigator.pushReplacementNamed(context, RouteName.signUp);
      } else {
        Navigator.pushReplacementNamed(context, RouteName.onBoarding);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ThemeScheme>(
      converter: (store) => store.state.scheme,
      onInitialBuild: (theme) {},
      builder: (context, theme) {
        ThemeScheme scheme = theme;
        return Scaffold(
          backgroundColor: ThemeColors.instance.primaryBackgrounColor(scheme),
          floatingActionButton: FloatingActionButton(
            heroTag: "1",
            onPressed: () {
              store?.dispatch(ThemeReducer(action: ActionOperation.setTheme, payload: theme == ThemeScheme.light ? ThemeScheme.dark : ThemeScheme.light));
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