import 'package:flutter/material.dart';
import 'package:quickmart/store/action/action.dart';
import 'package:quickmart/store/config/app_keys.dart';
import 'package:quickmart/store/config/app_state.dart';
import 'package:quickmart/template/route.dart';

class RouteReducer {
  ActionOperation action;
  dynamic payload;

  RouteReducer({required this.action, required this.payload});

  AppState mapOperationToState(AppState state) {
    switch(action) {
      case ActionOperation.bringToHome:
        AppKeys.navKey.currentState?.popUntil(ModalRoute.withName(RouteName.home));
        if (payload is HomeTab) {
          return state.remake(
            mHomeTab: payload
          );
        }
        break;
      case ActionOperation.setHomeTab:
        return state.remake(
          mHomeTab: payload
        );
      default:
        break;
    }
    return state;
  }
}